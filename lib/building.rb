class Building
  attr_reader :units
  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    renter = @units.map do |unit|
      unit.renter
    end
    renter.map do |renter|
      renter.name
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
end
