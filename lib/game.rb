class Game
  attr_reader :player1, :computer, :board
  def initialize
    @player1 = Player.new
    # @computer = Computer.new
    @board = Board.new
  end


  def start_menu
    p " ⚓⚓⚓ Welcome to BATTLESHIP ⚓⚓⚓ \n"
    p " Enter p to play. Enter q to quit"
    print ">"
    user_input = gets.chomp.downcase
    if user_input == "p"
      instructions
    elsif user_input == "q"
      puts "Fare thee well, Scallywag"
    end
  end

  def instructions
    puts "🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️"
    puts "Ahoy Matey!"
    puts "Up fer a friendly game of Battleship?"
    puts "I've placed mine ships, an' their"
    puts "where'bouts are none yer affair."
    puts ""
    puts "Place ye ships wisely"
    puts "as there be only hav'n two ships."
    puts "The Cruiser be three units long,"
    puts "while the submarine be two."
    puts "Here's ye map of tha game."
    puts ""
    puts "#{board.render}"
    require "pry"; binding.pry
    puts "Enough jabber'n, ye landlubber! \n"
    puts "It be time to place yer ships!"
    player1.place_cruiser
    puts "Here ye cruiser be"
    puts "#{player1.board.render(true)}"
    player1.place_sub
    puts "Here ye submarine be"
    puts "#{player1.board.render(true)}"
  end

  # def run
  #   until player1.has_lost? || computer.has_lost?
  #     puts "====================COMPUTER BOARD===================="
  #     # computer board render goes here
  #     puts "=====================PLAYER BOARD====================="
  #     # player board render(true) goes here
  #   end
  #   outcome # create a method that says who won
  #   start_menu # return to start menu
  # end

  # def outcome
  #   if !player1.has_lost?
  #     puts "Player1 has won the game!!!"
  #   elsif player1.has_lost?
  #     puts "Player1 has been defeated by the computer."
  # end



end
