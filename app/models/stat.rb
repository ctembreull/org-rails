class Stat < ActiveRecord::Base
  belongs_to :player
  belongs_to :team
  belongs_to :stat_definition
	
	scope :by_player, ->(p) { where{ (player_id == p) } }
	scope :by_year, ->(y) { where{ (season == y) } }
	scope :by_stint, ->(s) { where{ (stint == s) } }
	scope :by_team, ->(t) { where{ (team_id == t.id)}}
	scope :by_level, ->(l) { joins(team: :league).where{("leagues.level = '#{l}'")} }
	scope :by_franchise, ->(f) { joins(team: :franchise).where{(franchise = f)}}
	scope :batting, -> { joins(:stat_definition).where("stat_definitions.category = ?", 'batting') }
	scope :pitching, -> { joins(:stat_definition).where("stat_definitions.category = ?", 'pitching') }
	scope :baserunning, -> { joins(:stat_definition).where("stat_definitions.category = ?", 'baserunning') }
	scope :defense, -> { joins(:stat_definition).where("stat_definitions.category = ?", 'defense') }
	scope :levels, ->(y) { by_year(y).joins(team: :league).select(leagues: :level).distinct }
	
	def format
		puts "formatting..."
		sprintf(stat_definition.format, value)
	end
	
	def self.highest_level_stats(year)
		levels_by_rank = {'MLB' => 0, 'AAA' => 1, 'AA' => 2, 'A+' => 3, 'A' => 4, 'A-SS' => 5, 'R' => 6}
		highest_level = 'R'
		self.levels(year).each do |stat|
			if levels_by_rank[stat.level] < levels_by_rank[highest_level]
				highest_level = stat.level
			end
		end
		self.by_year(year).by_level(highest_level)
	end
	
	
		
	
	
	
end
