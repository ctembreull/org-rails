class Team < ActiveRecord::Base
  belongs_to :franchise
	belongs_to :league
end
