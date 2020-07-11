class Board
attr_reader :cells
  def initialize
    @cells = make_cells
  end
# This creates the cell objects and sets them as a value to the associated coordinate
# keys within a hash. make_cells is set to @cells and initialized that way.
  def make_cells
    {
      "A1" => Cell.new("A1"), "A2" => Cell.new("A2"), "A3" => Cell.new("A3"), "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"), "B2" => Cell.new("B2"), "B3" => Cell.new("B3"), "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"), "C2" => Cell.new("C2"), "C3" => Cell.new("C3"), "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"), "D2" => Cell.new("D2"), "D3" => Cell.new("D3"), "D4" => Cell.new("D4")
    }
  end
# This will determine if a coordinate is valid by checking if the given coordinate
# (provided by argument) matches the keys from the make_cells method (@cells).
  def valid_coordinate?(coordinate)
    cells.key?(coordinate)
  end
# This utilizes several methods to determine if a chosen placement on the board
# is valid or not for the given ship and given coordinates (provided by argument).
# This first determines if a given ship's length matches the length of given coordinates
# (ex: submarine length = 2, so coordinates.length should = 2 as well.) This will
# then check if
  def valid_placement?(ship, coordinates)
    coordinates.length == ship.length &&
      (valid_row_placement?(coordinates) && valid_column_spacing?(coordinates)) ||
      (valid_column_placement?(coordinates) && valid_row_spacing?(coordinates)) &&
      all_cells_are_empty?(coordinates)
  end

  # This splits our coordinates so that we can utilize the letters and numbers
  # seperate values when determining if our row or column placements
  # and spacing are valid.
  def split_coordinates(coordinates)
      coordinates.map do |coordinate|
      coordinate.split('')
    end
  end
# This method determines if placement on a row is valid.
  def valid_row_placement?(coordinates)
    # split is a variable that is set to hold coordinates after they
    # have been split by our split_coordinates method.
    split = split_coordinates(coordinates)
    # coordinate is a variable that is set to the first index of our variable
    # split. This should result in the first element of the 2d split array being
    # pulled out (ex: ["A", "1"])
    coordinate = split[0]
    # row is a variable that is set to hold the return value
    # of coordinate at index 0 - which should be a letter representing a row.
    # (ex: ["A"]).
    row = coordinate[0]
    # This will iterate over the array stored in split and compare all but
    # the first element to row
    split.each do |coordinate_letter|
      # This checks to confirm that the value of row is == to the index[0] of
      # the entire given coordinate (which is where the ship is meant to be placed).
      if row != coordinate_letter[0]
        # When the first coordinate_letter does not == row (a letter value)
        # then return false.
        return false
      end
    end
      # If all coordinates are of the same letter, this will return true. 
    return true
  end

  def valid_column_placement?(coordinates)
    split = split_coordinates(coordinates)
    coordinate = split[1]
    column = coordinate[1]
    split.each do |coordinate|
      if column != coordinate[1]
        return false
      end
    end
    return true
  end
  # This evaluates our column spacing by utilizing .each_with_index to help determine
  # where we want to look, .ord to give our letter values an integer to compare with,
  # and then comparing the distance between our ordinal values (ex: 66 vs 68) to
  # determine if our given coordinates are consecutive.
  def valid_column_spacing?(coordinates)
    split = split_coordinates(coordinates)
    split.each_with_index do |current_coordinate, index|
      if index != 0 #if we are on the first element we haven't navigated a space yet.
        previous_coordinate = split[index - 1]
        previous_column = previous_coordinate[1].ord
        current_column = current_coordinate[1].ord
        if previous_column - current_column != -1
          return false
        end
      end
    end
    return true
  end
# This evaluates our row spacing by utilizing .each_with_index to help determine
# where we want to look, .ord to give our letter values an integer to compare with,
# and then comparing the distance between our ordinal values (ex: 66 vs 68) to
# determine if our given coordinates are consecutive.
  def valid_row_spacing?(coordinates)
    split = split_coordinates(coordinates)
    split.each_with_index do |current_coordinate, index|
      if index != 0
        previous_coordinate = split[index - 1]
        previous_row = previous_coordinate[0].ord
        current_row = current_coordinate[0].ord
        if previous_row - current_row != -1
          return false
        end
      end
    end
    return true
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        if cells[coordinate].empty?
          cells[coordinate].place_ship(ship)
        end
      end
    end
  end

  def all_cells_are_empty?(coordinates)
    coordinates.all? do |coordinate|
      cells[coordinate].empty?
    end
  end

end
