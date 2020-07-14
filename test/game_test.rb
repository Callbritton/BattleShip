require 'minitest/autorun'
require 'minitest/pride'
require './lib/ships'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'
require './lib/computer'

class GameTest < Minitest::Test

  def test_it_exists
    # skip

    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_renders_the_board
    # skip

    game = Game.new

    clear_board = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal clear_board, game.board.render
  end


end
