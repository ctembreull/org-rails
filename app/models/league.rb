class League < ActiveRecord::Base
	
	validates :abbr, :name, :level, presence: true
	validates :abbr, uniqueness: true
	
	scope :alphabetical, -> { order('name ASC') }
	
	def logo
		"logo/#{self.class.to_s.downcase}/#{self.abbr.downcase}.gif"
	end
	
end
