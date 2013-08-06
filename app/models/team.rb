class Team < ActiveRecord::Base
  belongs_to :franchise
	belongs_to :league
	has_many :players
	
	validates :abbr, :city, :name, presence: true
	validates :abbr, uniqueness: true
	
	include Divisions
	
	def level
		league.level
	end
	
	def full_name
		[city, name].join(' ')
	end
	
	def logo
		"logo/#{self.class.to_s.downcase}/#{self.abbr.downcase}.gif"
	end
	
end
