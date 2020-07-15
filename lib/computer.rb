class Computer
  attr_reader :cruiser, :submarine, :board

  def initialize
    @cruiser = Ship.new('Crusier', 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
    @shots_taken = []
  end

  def computer_cruiser_placement
    loop do
      cruiser_coordinates = []
      cruiser.length.times do |coordinate|
        cruiser_coordinates << @board.cells.keys.sample
      end
      if
        board.valid_placement?(cruiser, cruiser_coordinates)
        board.place(cruiser, cruiser_coordinates)
        break
      end
    end
  end

  def computer_submarine_placement
    loop do
      submarine_coordinates = []
      submarine.length.times do |coordinate|
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
    if !@shots_taken.include?(computer_shot)
      @shots_taken << computer_shot
      player_board.cells["#{computer_shot}"].fire_upon
      if player_board.cells["#{computer_shot}"].render == "☠️"
        puts "💀 SUNK! 💀"
      elsif player_board.cells["#{computer_shot}"].render == "H"
        puts "💥 HIT! 💥 on #{computer_shot} "
      elsif player_board.cells["#{computer_shot}"].render == "M"
        puts "🌊 MISS! 🌊 on #{computer_shot}"
      end
    else
      cannon_blast(player_board)
    end
  end

  def has_lost?
    @cruiser.sunk? && @submarine.sunk?
  end
end
