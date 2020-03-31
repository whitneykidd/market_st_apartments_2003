class Building
  attr_reader :units, :renters
  def initialize
    @units = []
    @renters = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    @units.sum {|unit| unit.monthly_rent.to_f} / @units.count
  end

  # def add_renter
  #   @units.renters.map do |renter|
  #   @renters <<  renter.name
  #   end
  # end
end
