class Computer
  attr_reader :cruiser, :submarine, :board

  def initialize
    @cruiser = Ship.new('Crusier', 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
  end

  def computer_ship_placement
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

  def cannon_blast(player_board)
    computer_shot = @board.cells.keys.sample
    player_board.cells["#{computer_shot}"].fire_upon
    if player_board.cells["#{computer_shot}"].render == "☠️"
      puts "Sunk."
    elsif player_board.cells["#{computer_shot}"].render == "💥"
      puts "Hit on #{computer_shot} "
    elsif player_board.cells["#{computer_shot}"].render == "M"
      puts "Miss on #{computer_shot}"
    end
  end

  def has_lost?
    @cruiser.sunk? && @submarine.sunk?
  end
end
