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
      ((valid_row_placement?(coordinates) && valid_column_spacing?(coordinates)) ||
      (valid_column_placement?(coordinates) && valid_row_spacing?(coordinates))) &&
      all_cells_are_empty?(coordinates)
  end

  def split_coordinates(coordinates)
      coordinates.map do |coordinate|
      coordinate.split('')
    end
  end

  def valid_row_placement?(coordinates)
    split = split_coordinates(coordinates)
    coordinate = split[0]
    row = coordinate[0]
    split.each do |coordinate_letter|
      if row != coordinate_letter[0]
        return false
      end
    end
    return true
  end

  def valid_column_placement?(coordinates)
    split = split_coordinates(coordinates)
    coordinate = split[0]
    column = coordinate[1]
    split.each do |coordinate_number|
      if column != coordinate_number[1]
        return false
      end
    end
    return true
  end

  def valid_column_spacing?(coordinates)
    split = split_coordinates(coordinates)
    split.each_with_index do |current_coordinate, index|
      if index != 0
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

  def render(show = false)
    if show == false
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" +
      "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
      "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
      "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
    else
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
      "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
      "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
      "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
    end
  end
  
end
