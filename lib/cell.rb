class Cell
  attr_reader :coordinate, :cell, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @cell = []
  end

  def empty?
    @cell.empty?
  end

  def place_ship(cruiser)
    @cell << cruiser
  end
end
