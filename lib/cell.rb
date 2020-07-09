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
    case @ship
    when nil
      @shot_at = true
      @miss = true
    else
      @ship.hit
      @shot_at = true
      @miss = false
    end
  end

  # def render
  #   case @shot_at
  #   when !@shot_at
  #     "."
  #   when empty?
  #     "H"
  #   when !empty?
  #     "M"
  #   when ship.sunk?
  #     "X"
  #   end
  # end

  def render
    if @ship.sunk?
      "X"
    elsif !@shot_at
      "."
    elsif empty?
      "M"
    else !empty?
      "H"
    end
  end
end
