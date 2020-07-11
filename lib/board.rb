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

    # Method to make sure column placement is valid.
  def valid_column_placement?(coordinates)
    # split is a place holder for the coordinates. This allows us to
    # not only helps us pull out the column value but also to
    # iterate over each coordinate so we can compare it to the
    # intended column value.
    split = split_coordinates(coordinates)
    # We use the split array to parse out one set of coordiantes
    coordinate = split[1]
    # column assigns the test against value for the .each iteration
    column = coordinate[1]
    # Now we iterate over the split array pulling out each coordiante number.
    split.each do |coordinate_number|
    # This is testing every item in the array (besides the first, as that is
    # the criteria we are testing against) to make sure it equals the
    # column number.
      if column != coordinate_number[1]
    # If the test fails, stop the method.
        return false
      end
    end
    # If the test passes, move on to the next set.
    return true
  end

  # This evaluates our column spacing by utilizing .each_with_index to help determine
  # where we want to look, .ord to give our letter values an integer to compare with,
  # and then comparing the distance between our ordinal values (ex: 66 vs 68) to
  # determine if our given coordinates are consecutive.
  def valid_column_spacing?(coordinates)
  # split is the variable and helps us drill down into the coordinate to find
  # and compare the column number.
    split = split_coordinates(coordinates)
  # This looks in the split array so we can pull out the index value.
    split.each_with_index do |current_coordinate, index|
      # This essentially sets the comparison to look at all values that equal
      # the first index value within the split array.
      if index != 0 #if we are on the first element we haven't navigated a space yet.
        previous_coordinate = split[index - 1]
        # previous_column acts as a place holder so we can compare this value
        # to the next one. .ord is a nice way to represent letters as numerical
        # values.
        previous_column = previous_coordinate[1].ord
        # Much like previous_column, current_column is a place holder.
        current_column = current_coordinate[1].ord
        # The actual test to see if the current column's ord value is the
        # the difference of -1 with the ord value of the previous column.
        # We used negative one to make sure the values given are in accending
        #order (I.E. if the next value subtracted from the frist != -1, then
        #the order is not accending. 1 - 2 = -1 or 2 - 3 = -1 or 3 - 4 = -1).
        if previous_column - current_column != -1
        # If the test fails, breaks out and terminates method.
          return false
        end
      end
    end
   # If the test passes, then procceed.
    return true
  end
# This evaluates our row spacing by utilizing .each_with_index to help determine
# where we want to look, .ord to give our letter values an integer to compare with,
# and then comparing the distance between our ordinal values (ex: 66 vs 68) to
# determine if our given coordinates are consecutive.
  def valid_row_spacing?(coordinates)
    # Sets split as the varibale
    split = split_coordinates(coordinates)
    # Set through split and look at each index.
    split.each_with_index do |current_coordinate, index|
      # If that index is not equal to the first one, continue with the test.
      if index != 0
        # Sets placeholder to drill down into row.
        previous_coordinate = split[index - 1]
        # Sets placeholder for previous_row and translates the letter into its
        # numerical value.
        previous_row = previous_coordinate[0].ord
        # Sets placeholder for current_row and transforms the letter into its
        # numerical value.
        current_row = current_coordinate[0].ord
        # Test to make sure the difference in ord value is -1. -1 because the
        # absolute value of consecutive ord values may result in false placement
        # (I.E. If placing B (ord = 66), then A (ord =65) would result in 1 thus
        # setting a ship in reverse order which is invalid.)
        if previous_row - current_row != -1
          # Break out and notify player of invlid placement.
          return false
        end
      end
    end
    # Otherwise accept row placement of ship.
    return true
  end

  # Method to place a ship at coordiantes given.
  def place(ship, coordinates)
    # First, checks if the given ship and coordiantes allow for valid placement
    if valid_placement?(ship, coordinates)
      # Takes the each coordinate given to evaluate.
      coordinates.each do |coordinate|
        # Makes sure the cell's coordinates are vacant.
        if cells[coordinate].empty?
          # Method to place a ship within a cell.
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

  def render(show = false)
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render} #{@cells["A4"].render} \n" +
    "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
    "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
    "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
  end
end
