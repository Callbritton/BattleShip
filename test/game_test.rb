require 'minitest/autorun'
require 'minitest/pride'
require './lib/ships'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_greets_player
    game = Game.new


    assert_equal " ⚓⚓⚓ Welcome to BATTLESHIP ⚓⚓⚓ \n"
    " Enter p to play. Enter q to quit"
    ">", game.start_menu 
  end

end
