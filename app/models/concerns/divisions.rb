module Divisions extend ActiveSupport::Concern
	
	included do
		scope :alphabetical, -> { order('city ASC') }
		scope :al_west, -> { where{ abbr.like_any %w[HOU LAA OAK TEX SEA] } }
		scope :al_central, -> { where { abbr.like_any %w[CHW CLE DET KCR MIN] } }
		scope :al_east, -> { where{ abbr.like_any %w[NYY BOS TOR BAL TBR] } }
		scope :nl_west, -> { where{ abbr.like_any %w[LAD SDP COL ARI SFG] } }
		scope :nl_central, -> { where { abbr.like_any %w[CHC CIN PIT STL MIL] } }
		scope :nl_east, -> { where{ abbr.like_any %w[PHI NYM ATL WAS MIA] } }
	end
end