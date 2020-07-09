require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ships'
require_relative '../lib/cell'
require_relative '../lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    # skip
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_can_validate_coordinates
    #skip
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_it_can_add_cells
    #skip
    board = Board.new

    board.cells["D5"] = Cell.new("D5")
    assert_equal true, board.valid_coordinate?("D5")
  end

end
