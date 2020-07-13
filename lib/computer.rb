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
        break
      end
    end
  end

  def cannon_blast
    pirate_shot = @board.cells.keys.sample
    @board.cells["#{pirate_shot}"].fire_upon
    if @board.cells["#{pirate_shot}"].render == "☠️"
      puts "Sunk #{board.ship}."
    elsif @board.cells["#{pirate_shot}"].render == "💥"
      puts "Hit!"
    elsif @board.cells["#{pirate_shot}"].render == "M"
      puts "Miss."
    end
  end
end
