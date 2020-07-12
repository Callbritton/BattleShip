class Game

  def initialize

  end


  def start_menu
    p " ⚓⚓⚓ Welcome to BATTLESHIP ⚓⚓⚓ \n"
    p " Enter p to play. Enter q to quit"
    print ">"
    user_input = gets.chomp.downcase
    if user_input == "p"
      instructions
      # method that runs the game... maybe "load" or something.
    elsif user_input == "q"
      puts "Fare thee well, Scallywag"
    end
  end

  def instructions
    puts "🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️"
    puts "Ahoy Matey! \n"
    puts "Place ye ships wisely \n"
    puts "as there be only two ships in your control. \n"
    puts "The Cruiser be three units long, \n"
    puts "while the submarine be two. \n"
    puts "The game board is below. \n"
    puts "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    puts "Avast, ye landlubber! \n"
    puts "Give me tree cor'nates, \n"
    puts "and make true they be ascending"
    puts "> "
    puts "Here ye cruiser be"
    # player board rendered(true)
    puts "Now, give me two cor'nates"
    puts "> "
    puts "Here ye submarine be"
    # player board rendered(true)
  end

  # def load
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
  #
  # end



end
