class Cell
  attr_reader :coordinate, :cell, :ship, :show

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @shot_at = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @shot_at
  end

  def fire_upon
    @shot_at = true
    if empty?
      @miss = true
    elsif !empty?
      @ship.hit
    end
  end

  def render(show = false)
    if !empty? && @ship.sunk?
      "☠️"
    elsif @shot_at && empty?
      "M"
    elsif @shot_at && !empty?
      "H"
    elsif show == true && !empty?
      "S"
    elsif !@shot_at
      "."
    end
  end
end
