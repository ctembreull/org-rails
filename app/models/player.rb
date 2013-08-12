class Player < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :team
	has_many :disabled_players	#these are DL entries historically
	has_many :unavailable_players		#eg suspended, paternity, bereavement
	has_many :stats, class_name: "PlayerStat"
	
	validates :pid, :first_name, :last_name, :bats, :throws, presence: true
	validates :pid, uniqueness: true
	validates :bats, inclusion: { in: %w(L R S), message: "%{value} is not a valid batting handedness" }
	validates :throws, inclusion: { in: %w(L R S), message: "%{value} is not a valid throwing handedness" }
	
	scope :alphabetical, -> { order('last_name ASC') }
	scope :on_40, -> { where("on_40 = 't'") }
	scope :active, -> { where("retired = 'f'") }
	scope :unavailable, -> { where{(suspended == true) | (on_paternity == true) | (on_bereavement == true) | (restricted == true) | (dfa == true)} }
	scope :on_dl, -> { where{(on_dl == true)} }
	scope :free_agents, -> { where('franchise_id IS NULL') }
	scope :by_level, ->(level) { joins(:league).where('leagues.level = ?', level) }
	scope :by_position, ->(position) { where{position.like_any "%#{position}%"} }
	scope :infielders, -> { where{position.like_any %w[1B 2B 3B SS C].map{|p| "%#{p}%"}} }
	scope :outfielders, -> { where{position.like_any %w[OF CF LF RF].map{|p| "%#{p}%"}} }
	scope :middle_infielders, -> { where{position.like_any %w[2B SS].map{|p| "%#{p}%"}} }
	scope :corner_infielders, -> { where{position.like_any %w[1B 3B].map{|p| "%#{p}%"}} }
	scope :hitters, -> { where{position.like_any %w[1B 2B 3B SS C OF LF CF RF DH].map{|p| "%#{p}%"}} }
	scope :designated_hitters, -> { where{position.like_any %w[DH].map{|p| "%#{p}%"}} }
	scope :starters, -> { where{position.like_any %w[SP].map{|p| "%#{p}%"}} }
	scope :relievers, -> { where{position.like_any %w[RP].map{|p| "%#{p}%"}} }
	scope :pitchers, -> { where{position.like_any %w[P SP RP].map{|p| "%#{p}%"}} }
	scope :throws_left, -> { where("throws = 'L'") }
	scope :throws_right, -> { where("throws = 'R'") }
	scope :bats_left, -> { where("bats = 'L'") }
	scope :bats_right, -> { where("bats = 'R'") }
	scope :bats_switch, -> { where("bats = 'S'") }
	
	def first_last
		[first_name, last_name].join(' ')
	end
	
	def last_first
		[last_name, first_name].join(' ')
	end
	
	def age
		return '' if birth_date.nil?
		(Date.today - birth_date).to_i / 365
	end
	
	def name_position
		positions = position.split(/,\s*/)
		first_last + ", #{positions[0]}"
	end
	
	# Send a player to the disabled list
	def to_disabled_list(length=15, start_date=Date.today, reason)
		return false if on_dl
		DisabledPlayer.create({franchise: self.franchise, player: self, year: 2013, length: length, start_date: start_date, reason: reason, rehab: false})
		update({on_dl: true, team: nil})
	end
	
	# Modify a player's current disabled list entry
	def update_disabled_list(params)
		return false unless on_dl
		params = params.keep_if {|k,v| k == 'length' || k == 'start_date'}
		self.disabled_players.current.take.update(params)
	end
	
	# Send a currently disabled player to a rehab assignment
	def to_rehab(assigned_team)
		return false unless on_dl
		self.disabled_players.current.take.update({rehab: true}) unless self.disabled_players.current.length == 0
		update({team: assigned_team})
	end
	
	# Activate player from the disabled list and assign him to a team
	def from_disabled_list(end_date=Date.today, assigned_team)
		return false unless on_dl
		self.disabled_players.current.take.update({end_date: end_date, rehab: false}) unless self.disabled_players.current.length == 0
		update({on_dl: false, team: assigned_team})
	end
	
	# Place player on the unavailable list
	def deactivate(length=7, start_date=Date.today, reason)
		return false if unavailable?
		UnavailablePlayer.create({player: self, franchise: self.franchise, year: 2013, length: length, start_date: start_date, reason: reason})
		update({team: nil})
		#ideally, this would put a scheduled task in that would automatically end the suspension after given games have passed
	end
	
	# Take player off suspension and assign to a team
	def reactivate(end_date=Date.today, assigned_team)
		return false unless unavailable?
		self.unavailable_players.current.take.update({end_date: end_date})
		update({team: assigned_team})
	end
	
	# Place player on paternity list
	def to_paternity_list(start_date=Date.today, reason="Placed on paternity list")
		return false if on_paternity?
		deactivate(3, start_date, reason)
		update({on_paternity: true})
	end
	
	# Return player from paternity list
	def from_paternity_list(end_date=Date.today, assigned_team)
		return false unless on_paternity?
		reactivate(end_date, assigned_team)
		update({on_paternity: false})
	end
	
	# Place player on bereavement list
	def to_bereavement_list(start_date=Date.today, reason="Placed on bereavement list")
		return false if on_bereavement?
		deactivate(3, start_date, reason)
		update({on_bereavement: true})
	end
	
	# Return player from bereavement list
	def from_bereavement_list(end_date=Date.today, assigned_team)
		return false unless on_bereavement?
		reactivate(end_date, assigned_team)
		update({on_bereavement: false})
	end
	
	def to_restricted_list(start_date=Date.today, reason="Placed on restricted list")
		return false if restricted?
		deactivate(-1, start_date, reason)
		update({restricted: true})
	end
	
	def from_restricted_list(end_date=Date.today, assigned_team)
		return false unless restricted?
		reactivate(end_date, assigned_team)
		update({restricted: false})
	end
	
	def designate_for_assignment(start_date=Date.today)
		return false if dfa?
		deactivate(10, start_date, "Designated for assignment")
		update({dfa: true})
	end
	
	def assign(date=Date.today, assigned_team)
		if self.unavailable_players.current.length > 0
			reactivate(date, assigned_team)
		end
		update({team: assigned_team, dfa: false, restricted: false, on_bereavement: false, on_paternity: false, suspended: false})
	end
	
	def to_free_agency
		update({franchise: nil, team: nil})
	
	def on_rehab?
		on_dl == true && !team.nil?
	end
	
	def unavailable?
		suspended == true || on_bereavement == true || on_paternity == true || restricted == true || dfa == true
	end
	
	
	
end
