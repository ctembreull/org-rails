class Franchise < ActiveRecord::Base
	has_many :teams
	has_many :leagues, through: :teams
	has_many :players
	
	validates :abbr, :city, :name, presence: true
  validates :abbr, uniqueness: true
	
	include Divisions

	def full_name
		[city, name].join(' ')
	end

	def logo
		"logo/#{self.class.to_s.downcase}/#{abbr.downcase}.gif"
	end
	
	def wordmark
		"logo/#{self.class.to_s.downcase}/#{abbr.downcase}_wordmark.gif"
	end
	
end
