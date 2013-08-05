require 'test_helper'

class LeagueTest < ActiveSupport::TestCase
  fixtures :leagues
	
	test "league attributes must not be empty" do
		l = League.new
		assert l.invalid?
		assert l.errors[:abbr].any?
		assert l.errors[:name].any?
		assert l.errors[:level].any?
	end
	
	test "league abbreviation must be unique" do
		l = League.new(abbr: leagues(:pacific_coast).abbr, name: 'Northern League', level: 'IND')
		assert l.invalid?
		assert_equal ["has already been taken"], l.errors[:abbr]
	end
	
	test "has a teams relation" do
		assert leagues(:american).teams.is_a? ActiveRecord::Relation
	end
	
	test "has a franchises relation (through teams)" do
		assert leagues(:american).franchises.is_a? ActiveRecord::Relation
	end
	
end
