require 'minitest/autorun'
require 'minitest/pride'
require './lib/ships'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/computer'

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
     skip
     computer = Computer.new

      assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n",
      computer.board.render

      board.place(cruiser, ["D1", "D2", "D3"])
      assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n",
      computer.board.render
  end
    def test_player_board_shows_ships_hit
      skip
      #Think I need to be hitting player's board not computer's
      computer = Computer.new

      board.place(cruiser, ["D1", "D2", "D3"])
      cell_1.fire_upon
      assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD H . . . \n",
      computer.board.render
     end

     def test_player_board_shows_sunken_ships
       skip
       computer = Computer.new

       #player.board.render
       board.place(cruiser, ["D1", "D2", "D3"])
       cell_1.fire_upon
       cell_2.fire_upon
       assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD H H . . \n",
       #player.board.render
       computer.board.render

       cell_3.fire_upon
       assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD X X X . \n",
       #player.board.render
       computer.board.render
      end

      def test_player_board_shows_misses
        skip
        #Think I need to be hitting player's board not computer's
        computer = Computer.new

        board.place(cruiser, ["D2", "D3", "D4"])
        cell_1.fire_upon
        assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD M . . . \n",
        computer.board.render
       end
end
