class UnavailablePlayer < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :player
	
	scope :current, -> { where('end_date is null') }
end
