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
    require "pry"; binding.pry

    if board.valid_placement?(cruiser, coordinates)
      board.place(cruiser, coordinates)
    else
      puts "***Wrong coordinates, landlubber!*** \n"
      puts "***I need tree coordinates...***"
      place_cruiser
    end
  end

  def place_submarine
    coordinates = []
    puts "The submarine utilizes 2 coordinates."
    puts "Enter yer first coordinate:"
    print "> "
    first_coordinate = gets.chomp.upcase
    coordinates << first_coordinate
    puts "Enter yer second coordinate:"
    print "> "
    second_coordinate = gets.chomp.upcase
    coordinates << second_coordinate

    if board.valid_placement?(submarine, coordinates)
      board.place(submarine, coordinates)
    else
      puts "***Wrong coordinates, landlubber!*** \n"
      puts "***I need tree coordinates...***"
      place_submarine
    end
  end

  def cannon_blast
    puts "Now tis yer turn to fire!"
    puts "Hit me if ye can, landlubber!"
    player_shot = gets.chomp.upcase.split(" ")

    

  end

end
