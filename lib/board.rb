class Board
attr_reader :cells
  def initialize
    @cells = make_cells

  end

  def make_cells
    {
      "A1" => Cell.new("A1"), "A2" => Cell.new("A2"), "A3" => Cell.new("A3"), "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"), "B2" => Cell.new("B2"), "B3" => Cell.new("B3"), "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"), "C2" => Cell.new("C2"), "C3" => Cell.new("C3"), "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"), "D2" => Cell.new("D2"), "D3" => Cell.new("D3"), "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    cells.key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    coordinates.length == ship.length &&
      (valid_row_placement?(coordinates) && valid_column_spacing?(coordinates)) ||
      (valid_column_placement?(coordinates) && valid_row_spacing?(coordinates))
  end

  #This splits our coordinates!
  def split_coordinates(coordinates)
      coordinates.map do |coordinate|
      coordinate.split('')
    end
  end

  def valid_row_placement?(coordinates)
    split = split_coordinates(coordinates)
    coordinate = split[0]
    row = coordinate[0]
    split.each do |coordinate|
      if row != coordinate[0]
        return false
      end
    end
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
end

  # This will seperate our split coordinates into letters.
  def seperate_by_rows(coordinates)
    split_coordinates(coordinates).map { |coordinate| coordinate[0] }
  end
  
  # This will seperate our split coordinates into numbers - added .to_i as it
  # was returning strings.
  def seperate_by_columns(coordinates)
    split_coordinates(coordinates).map { |coordinate| coordinate[1].to_i }
  end

  # This will evaluate true/false if all? are letters:
  def check_in_rows(coordinates)
    seperate_by_rows(coordinates).all? { |row| seperate_by_rows(coordinates)[0] == row }
  end
  # This will evaluate true/false if all? are numbers:
  def check_in_columns(coordinates)
    seperate_by_columns(coordinates).all? { |column| seperate_by_columns(coordinates)[1] == column }
  end
