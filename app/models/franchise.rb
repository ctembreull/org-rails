class Franchise < ActiveRecord::Base
	
	validates :abbr, :city, :name, presence: true
  validates :abbr, uniqueness: true
	
	scope :alphabetical, -> { order('city ASC') }
	scope :al_west, -> { where{ abbr.like_any %w[HOU LAA OAK TEX SEA] } }
	scope :al_central, -> { where { abbr.like_any %w[CHW CLE DET KCR MIN] } }
	scope :al_east, -> { where{ abbr.like_any %w[NYY BOS TOR BAL TAM] } }
	scope :nl_west, -> { where{ abbr.like_any %w[LAD SDP COL ARI SFG] } }
	scope :nl_central, -> { where { abbr.like_any %w[CHC CIN PIT STL MIL] } }
	scope :nl_east, -> { where{ abbr.like_any %w[PHI NYM ATL WAS MIA] } }

	def logo
		"logo/#{self.class.to_s.downcase}/#{abbr.downcase}.gif"
	end
	
	def wordmark
		"logo/#{self.class.to_s.downcase}/#{abbr.downcase}_wordmark.gif"
	end
	
end
