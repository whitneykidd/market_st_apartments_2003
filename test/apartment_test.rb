require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter.rb'
require './lib/apartment.rb'

class RenterTest < Minitest::Test
  def setup
    @renter1 = Renter.new("Jessie")
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
  end

  def test_it_exists
    assert_instance_of Apartment, @unit1
  end
end
