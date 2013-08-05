class Player < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :team
	
	validates :pid, :first_name, :last_name, :bats, :throws, presence: true
	validates :pid, uniqueness: true
	validates :bats, inclusion: { in: %w(L R S), message: "%{value} is not a valid batting handedness" }
	validates :throws, inclusion: { in: %w(L R S), message: "%{value} is not a valid throwing handedness" }
	
	scope :alphabetical, -> { order('last_name ASC') }
	scope :on_40, -> { where("on_40 = 't'") }
	scope :active, -> { where("retired = 'f'") }
	scope :free_agents, -> { where('franchise_id IS NULL') }
	scope :by_level, ->(level), { joins(:league).where('leagues.level = ?', level) }
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
	
end
