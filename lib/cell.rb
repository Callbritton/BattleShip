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

  def render(variable = nil)
    if @shot_at == false
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

#   def render
#     case @shot_at
#     when @shot_at
#       "."
#     when ship.hit
#       "H"
#     when !@shot_at
#       "M"
#     when ship.sunk?
#       "X"
#     end
#   end
# end
