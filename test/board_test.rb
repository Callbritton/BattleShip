require 'minitest/autorun'
require 'minitest/pride'
require './lib/ships'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    # skip
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_can_validate_coordinates
    # skip
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_it_can_add_cells
    # skip
    board = Board.new

    board.cells["D5"] = Cell.new("D5")
    assert_equal true, board.valid_coordinate?("D5")
  end

  def test_it_can_validate_ship_length_for_valid_placement
    # skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    coordinates = ["A1", "A2"]

    assert_equal false, board.valid_placement?(cruiser, coordinates)
    assert_equal true, board.valid_placement?(submarine, coordinates)

  end

  def test_coordinates_are_split
    # skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    coordinates = ["A1", "A2", "A3", "A4"]

    assert_equal [["A", "1"], ["A", "2"], ["A", "3"], ["A", "4"]], board.split_coordinates(coordinates)
  end

  def test_it_is_in_singular_row
    # skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    coordinates = ["A1", "A2", "A3", "A4"]

    assert_equal true, board.valid_row_placement?(coordinates)

    coordinates = ["A1", "A2", "B3", "A4"]

    assert_equal false, board.valid_row_placement?(coordinates)

  end

  def test_it_is_in_singular_column
    # skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    coordinates = ["A1", "B1", "C1", "D1"]

    assert_equal true, board.valid_column_placement?(coordinates)

    coordinates = ["A1", "A2", "B3", "A4"]

    assert_equal false, board.valid_column_placement?(coordinates)

  end

  def test_it_is_valid_for_columns
    # skip
    board = Board.new

    coordinates = ["A1", "A2", "A3", "A4"]
    assert board.valid_column_spacing?(coordinates)

    coordinates = ["A1", "A2", "A4"]
    refute board.valid_column_spacing?(coordinates)

    coordinates = ["A1", "A3", "A2"] # Ask Nico if his test will pass!
    refute board.valid_column_spacing?(coordinates)

  end

  def test_it_is_valid_for_row
    # skip
    board = Board.new

    coordinates = ["A1", "B1", "C1", "D1"]
    assert board.valid_row_spacing?(coordinates)

    coordinates = ["A1", "B1", "D1"]
    refute board.valid_row_spacing?(coordinates)

    coordinates = ["A1", "C1", "B1"] # Ask Nico if his test will pass!
    refute board.valid_row_spacing?(coordinates)
  end

  def test_coordinates_given_must_be_consecutive
    # skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(cruiser, ["C1", "B1"])
  end

  def test_coordinates_given_cannot_be_diagonal
    # skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_it_can_place_a_ship
    # skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    assert_equal cruiser, cell_1.ship
    assert_equal cruiser, cell_2.ship
    assert_equal cruiser, cell_3.ship
    assert cell_3.ship == cell_2.ship
  end

end
