class Building
  attr_reader :units
  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    renters = @units.find_all do |unit|
      unit.renter != nil
    end
    renters.map do |unit|
      unit.renter.name
    end
  end

  def average_rent
    @units.sum {|unit| unit.monthly_rent.to_f} / @units.count
  end

  def rented_units
    units_rented = []
    @units.find_all do |unit|
      if unit.renter != nil
        units_rented << unit
      end
    end
  end

  def renter_with_highest_rent
    highest_unit = rented_units.max_by do |unit|
      unit.monthly_rent
    end
    highest_unit.renter
  end

  def units_by_number_of_bedrooms
    bedrooms = {}
    @units.each do |unit|
      if bedrooms.keys.include?(unit.bedrooms)
        bedrooms[unit.bedrooms] << unit.number
      else
      bedrooms[unit.bedrooms] = [unit.number]
      end
    end
    bedrooms
  end

  def annual_breakdown
    breakdown = {}
    rented_units.each do |unit|
      breakdown[unit.renter.name] = (unit.monthly_rent * 12)
    end
    breakdown
  end

  def rooms_by_renter
    by_renter = {}
    rented_units.map do |unit|
      by_renter[unit.renter] = {bathrooms: unit.bathrooms, bedrooms: unit.bedrooms}
    end
  by_renter
  end
end
