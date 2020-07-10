class Cell
  attr_reader :coordinate, :cell, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @shot_at = false
    @miss = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(boat)
    @ship = boat
  end

  def fired_upon?
    @shot_at
  end

  def fire_upon
    if @ship == nil # converted this back to a proper if statement 
      @shot_at = true
      @miss = true
    else
      @ship.hit
      @shot_at = true
      @miss = false
    end
  end

  def render(variable = nil)
    if !@shot_at #== false - refactored this to be more tidy!
      "."
    elsif !@ship
      "M"
    elsif @ship && ship.health > 0
      "H"
    elsif ship.sunk?
      "X"
    end
  end
end
