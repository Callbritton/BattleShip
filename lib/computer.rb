class Computer
  attr_reader :cruiser, :submarine, :board

  def initialize
    @cruiser = Ship.new('Crusier', 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
  end

  def computer_ship_placement
    #if baseline random placement
    # iterate over ships to place each ship
    # submarine_starts_invalid(ships[1], ["A1", "D4"])
    loop do
      cruiser_coordinates = []
      3.times do |coordinate|
        cruiser_coordinates << @board.cells.keys.sample
      end
      if
        board.valid_placement?(cruiser, cruiser_coordinates)
        board.place(cruiser, cruiser_coordinates)
        break
      end
    end
    loop do
      submarine_coordinates = []
      2.times do |coordinate|
        submarine_coordinates << @board.cells.keys.sample
      end
      if
        board.valid_placement?(submarine, submarine_coordinates)
        board.place(submarine, submarine_coordinates)
        require "pry"; binding.pry
        break
      end
    end
  end

      # def submarine_starts_invalid(ships[1], ["A1", "D4"])
      #
      # end
end

    #ship.length decrements to place remaining ship
    #how to obtain proper ord values and make sure
    #each difference is -1.
    # potential_placement -= potential_placement
    #
    # if potential_placement == board.valid_placement?
    #   place(ships[0])
#   end
#
#end
