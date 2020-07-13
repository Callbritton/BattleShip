require 'minitest/autorun'
require 'minitest/pride'
require './lib/ships'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/computer'
# require './lib/player'

class ComputerTest < Minitest::Test

  def test_it_exists
    computer = Computer.new

    assert_instance_of Computer, computer

  end

  def test_computer_has_ships
    computer = Computer.new

    assert_instance_of Ship, computer.cruiser
    assert_instance_of Ship, computer.submarine
  end

  def test_computer_places_ships_randomly
    #how would one test if random = random?
    # skip
    computer = Computer.new
    computer.computer_ship_placement

  end
  def test_computer_has_hidden_board
    # skip
    computer = Computer.new
    cruiser = Ship.new("Cruiser", 3)

    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n",
    computer.board.render
    computer.board.place(cruiser, ["D1", "D2", "D3"])
    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n",
    computer.board.render
  end
  def test_board_shows_ships_hit
    # skip
    #Think I need to be hitting player's board not computer's
    computer = Computer.new
    cruiser = Ship.new("Cruiser", 3)

    computer.board.place(cruiser, ["D1", "D2", "D3"])
    computer.board.cells["D1"].fire_upon
    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD 💥 . . . \n",
    computer.board.render
  end

  def test_board_shows_sunken_ships
    # skip
    computer = Computer.new
    cruiser = Ship.new("Cruiser", 3)


    computer.board.place(cruiser, ["D1", "D2", "D3"])
    computer.board.cells["D1"].fire_upon
    computer.board.cells["D2"].fire_upon
    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD 💥 💥 . . \n",
    computer.board.render

    computer.board.cells["D3"].fire_upon
    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD ☠️ ☠️ ☠️ . \n",
    #player.board.render
    computer.board.render
  end

  def test_board_shows_misses
    # skip
    computer = Computer.new
    cruiser = Ship.new("Cruiser", 3)

    computer.board.place(cruiser, ["D2", "D3", "D4"])
    computer.board.cells["D1"].fire_upon
    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD M . . . \n",
    computer.board.render
  end

  def test_shots_return_💥_or_miss
    computer = Computer.new
    submarine = Ship.new("Submarine", 2)

    computer.board.place(submarine, ["C2", "C3"])
    computer.cannon_blast
  

  end
end
