class Cell
  attr_reader :coordinate, :cell, :ship, :show

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
    if !fired_upon?
      if empty?
      @shot_at = true
      @miss = true
      elsif !empty?
      @ship.hit
      @shot_at = true
      @miss = false
      end
    # else "Scallywag! You've alredy shot here, try again."
    end
  end
# This establishes what should be rendered given different conditions.
# If a cell has not been shot at (!@shot_at) it will render ".",
# elsif a cell IS shot_at, but there is not a ship present, it will render "M".
# elsif a cell IS shot_at, and there is a ship present with health > 0 renders "H".
# else, the cell will render "X" if there was a ship present but it has been sunk.
  def render(show = false)
    if !empty? && @ship.sunk?
      "X"  # visually appealing
    elsif @shot_at && empty?
      "M"
    elsif @shot_at && !empty?
      "H"  # visually appealing
    elsif show == true && !empty?
      "S"
    elsif !@shot_at
      "."
    end
  end
end
