class Player < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :team
	
	validates :pid, :first_name, :last_name, :bats, :throws, presence: true
	validates :pid, uniqueness: true
	validates :bats, inclusion: { in: %w(L R S), message: "%{value} is not a valid batting handedness" }
	validates :throws, inclusion: { in: %w(L R S), message: "%{value} is not a valid throwing handedness" } 
	
	
end
