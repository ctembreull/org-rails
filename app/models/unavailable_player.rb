class UnavailablePlayer < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :player
end
