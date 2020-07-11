class Cell
  attr_reader :coordinate, :cell, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @shot_at = false
    @miss = false
  end
# This will evaluate whether a ship is present in a given cell
  def empty?
    @ship == nil
  end
# This takes an argument of a type of ship, and when called
# will place that ship in a cell.
  def place_ship(ship)
    @ship = ship
  end
# This looks at @shot_at
  def fired_upon?
    @shot_at
  end
# This will evaluate if a ship is present or not. If a ship is NOT present
# then @shot_at will be true and @miss will be true.
# If a ship IS present this will call @ship.hit (reducing the targeted ship's
# health by 1), set @shot_at to true, and @miss to false.
  def fire_upon
    if @ship == nil
      @shot_at = true
      @miss = true
    else
      @ship.hit
      @shot_at = true
      @miss = false
    end
  end
# This establishes what should be rendered given different conditions.
# If a cell has not been shot at (!@shot_at) it will render ".",
# elsif a cell IS shot_at, but there is not a ship present, it will render "M".
# elsif a cell IS shot_at, and there is a ship present with health > 0 renders "H".
# else, the cell will render "X" if there was a ship present but it has been sunk.
  def render(show = false)
    if !@shot_at
      "."
    elsif !@ship
      "M"
    elsif @ship && ship.health > 0
      "H"  # visually appealing 💥
    elsif ship.sunk?
      "X"  # visually appealing ☠️
    end
  end
end
