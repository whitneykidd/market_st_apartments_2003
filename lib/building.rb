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
end
