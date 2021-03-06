require 'minitest/autorun'
require 'minitest/pride'
require './lib/ships'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'
require './lib/computer'

class PlayerTest < Minitest::Test

  def test_it_exists
    # skip
    player1 = Player.new

    assert_instance_of Player, player1
  end

  def test_player_can_lose
    player = Player.new

    assert_equal false, player.has_lost?

    3.times do player.cruiser.hit end
    2.times do player.submarine.hit end

    assert_equal true, player.has_lost?
  end

  # def test_player_can_place_cruisers
  #   # skip
  #   player1 = Player.new
  #   cruiser = player1.cruiser
  #
  #   # this test is not dynamic - the assertion is only true
  #   # if user input matches (tests the desired functionality
  #   # all the same).
  #
  #   assert_equal ["A1", "A2", "A3"], player1.place_cruiser
  # end

  # def test_player_can_place_submarines
  #   # skip
  #   player1 = Player.new
  #   submarine = player1.submarine
  #
  #   # this test is not dynamic - the assertion is only true
  #   # if user input matches (tests the desired functionality
  #   # all the same).
  #   assert_equal ["A1", "A2"], player1.place_submarine
  # end

end
