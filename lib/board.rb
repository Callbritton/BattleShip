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
    coordinates.length == ship.length
  end

  #This splits our coordinates!
  def split_coordinates(coordinates)
    coordinates.map do |coordinate|
      coordinate.split('')
    end
  end

  # This will seperate our split coordinates into letters.
  def seperate_by_letter(coordinates)
    split_coordinates(coordinates).map { |coordinate| coordinate[0] }
  end

  # This will seperate our split coordinates into numbers - added .to_i as it
  # was returning strings.
  def seperate_by_number(coordinates)
    split_coordinates(coordinates).map { |coordinate| coordinate[1].to_i }
  end

  # This will evaluate true/false if all? are letters:
  def check_is_all_letters(coordinates)
    seperate_by_letter(coordinates).all? { |letter| seperate_by_letter(coordinates)[0] == letter }
  end
  # This will evaluate true/false if all? are numbers:
  def check_is_all_numbers(coordinates)
    seperate_by_number(coordinates).all? { |number| seperate_by_numbers(coordinates)[1] == number }
  end


end
