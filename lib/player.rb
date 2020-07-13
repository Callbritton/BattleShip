class Player
  attr_reader :board, :cruiser, :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def place_cruiser
    puts "Yar gonna need to give me tree coordinates..."
    puts ""
    print "> "
    coordinates = gets.chomp.upcase.split(" ")

    if board.valid_placement?(cruiser, coordinates)
      board.place(cruiser, coordinates)
    else
      puts "***Wrong coordinates, landlubber!*** \n"
      puts "***I need tree good coordinates...***"
      place_cruiser
    end
  end

  def place_submarine
    puts "Yar gonna need to give me tree coordinates..."
    puts ""
    print "> "
    coordinates = gets.chomp.upcase.split(" ")

    if board.valid_placement?(submarine, coordinates)
      board.place(submarine, coordinates)
    else
      puts "***Wrong coordinates, landlubber!*** \n"
      puts "***I need tree good coordinates...***"
      place_submarine
    end
  end

end
