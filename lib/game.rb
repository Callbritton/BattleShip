class Game
  attr_reader :player, :computer, :board
  def initialize
    @player = Player.new
    @computer = Computer.new
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
    puts "Enough jabber'n, ye landlubber! \n"
    puts "It be time to place yer ships!"
    player.place_cruiser
    puts "Here ye cruiser be"
    puts "#{player.board.render(true)}"
    player.place_submarine
    puts "Here ye ships be"
    puts "======PLAYER BOARD======"
    puts "#{player.board.render(true)}"
    puts "========================"
    puts ""
    sleep(2)

    turn
  end

  def turn
    computer.computer_ship_placement
    until player.has_lost? || computer.has_lost?

      puts "=====COMPUTER BOARD====="
      puts "#{computer.board.render(true)}"
      puts "========================"
      puts " "
      puts "======PLAYER BOARD======"
      puts "#{player.board.render(true)}"
      puts "========================"
      sleep(2)
      puts "Computer takes a shot"
      computer.cannon_blast(player.board)
      puts "======PLAYER BOARD======"
      puts "#{player.board.render(true)}"
      puts "========================"
      puts " "
      player.cannon_blast(computer.board)
    end
    outcome
    start_menu # return to start menu
  end
  def outcome
    if !player.has_lost?
      puts "🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️"
      puts "Yar how could ya beat me computer."
    else
      puts "Down to Davey Jones' locker with ya."
      puts "Computer has won the game!"
    end
  end
end
