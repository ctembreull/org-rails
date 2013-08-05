class Team < ActiveRecord::Base
  belongs_to :franchise
	belongs_to :league
	
	validates :abbr, :city, :name, presence: true
	validates :abbr, uniqueness: true
	
	include Divisions
	
	def level
		league.level
	end
	
	def logo
		"logo/#{self.class.to_s.downcase}/#{self.abbr.downcase}.gif"
	end
	
end
