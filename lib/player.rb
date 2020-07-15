class Player
  attr_reader :board, :cruiser, :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @shots_taken = []
  end

  def place_cruiser
    puts "Yar gonna need to give me TREE coordinates..."
    puts ""
    print "> "
    coordinates = gets.chomp.upcase.split(" ")

    if board.valid_placement?(cruiser, coordinates)
      board.place(cruiser, coordinates)
    else
      puts "***Wrong coordinates, landlubber!*** \n"
      puts "***I need TREE coordinates...***"
      place_cruiser
    end
  end

  def place_submarine
    puts "Yar gonna need to give me TWO coordinates..."
    puts ""
    print "> "
    coordinates = gets.chomp.upcase.split(" ")

    if board.valid_placement?(submarine, coordinates)
      board.place(submarine, coordinates)
    else
      puts "***Wrong coordinates, landlubber!*** \n"
      puts "***I need TWO coordinates...***"
      place_submarine
    end
  end

  def cannon_blast(computer_board)
    puts "Now tis yer turn to fire!"
    puts "Hit me if ye can, landlubber!"
    puts ""

    player_shot = gets.chomp.upcase

    if board.valid_coordinate?(player_shot) && !@shots_taken.include?(player_shot)
      @shots_taken << player_shot
      computer_board.cells[player_shot].fire_upon
      if computer_board.cells[player_shot].render == "☠️"
        puts "Sunk."
      elsif computer_board.cells[player_shot].render == "H"
        puts "Hit!"
      elsif computer_board.cells[player_shot].render == "M"
        puts "Miss."
      end
    else
      puts "What ye thinkn, landlubber?"
      puts "Ye already blown dis hole"
      cannon_blast(computer_board)
      end
    end

    def has_lost?
      @cruiser.sunk? && @submarine.sunk?
    end
end
