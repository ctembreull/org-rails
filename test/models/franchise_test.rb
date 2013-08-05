require 'test_helper'

class FranchiseTest < ActiveSupport::TestCase
	
	fixtures :franchises
	
	test "franchise attributes must not be empty" do
		f = Franchise.new
		assert f.invalid?
		assert f.errors[:abbr].any?
		assert f.errors[:city].any?
		assert f.errors[:name].any?
	end
	
	test "franchise is not valid without a unique abbreviation" do
		f = Franchise.new(abbr: franchises(:nyy).abbr, city: 'Independent', name: 'Team')
		assert f.invalid?
		assert_equal ["has already been taken"], f.errors[:abbr]
	end
		
		
end
