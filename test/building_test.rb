require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter.rb'
require './lib/apartment.rb'
require './lib/building.rb'

class BuildingTest < Minitest::Test
  def setup
    @building = Building.new
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @renter1 = Renter.new("Aurora")
    @renter2 = Renter.new("Tim")
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_it_has_attributes
    assert_equal [], @building.units
    # assert_equal [], @building.renters
  end

  def test_it_can_add_units
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    assert_equal [@unit1, @unit2], @building.units
  end

  def test_returns_renters
    assert_equal [], @building.renters
    @building.add_unit(@unit1)
    @unit1.add_renter(@renter1)
    assert_equal ["Aurora"], @building.renters

    @building.add_unit(@unit2)
    @unit2.add_renter(@renter2)
    assert_equal ["Aurora", "Tim"], @building.renters
  end

  def test_returns_average_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    assert_equal 1099.5, @building.average_rent
  end
end
