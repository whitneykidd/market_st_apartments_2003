require './lib/apartment.rb'
require './lib/renter.rb'

RSpec.describe Apartment, type: :model do
  describe "Class Methods" do
    describe ".add_renter" do
      it "returns the added renter" do
        renter1 = Renter.new("Jessie")
        unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
        unit1.add_renter(renter1)
        expect(unit1.renter).to eq(renter1)
      end
    end
  end
end
