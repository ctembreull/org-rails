require 'test_helper'

class TeamTest < ActiveSupport::TestCase
	
	fixtures :teams
	fixtures :franchises
	fixtures :leagues
	
	test "team attributes must not be empty" do
		t = Team.new
		assert t.invalid?
		assert t.errors[:abbr].any?
		assert t.errors[:city].any?
		assert t.errors[:name].any?
	end
	
	test "team must have unique abbreviation" do
		t = Team.new(abbr: teams(:nyy).abbr)
		assert t.invalid?
		assert_equal ["has already been taken"], t.errors[:abbr]
	end
	
	test "logo returns predictable string" do
		assert_equal "logo/team/nyy.gif", teams(:nyy).logo
	end

end
