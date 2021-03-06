class Game
  attr_reader :player, :computer
  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def start_menu
    puts " ⚓⚓⚓ Welcome to BATTLESHIP ⚓⚓⚓ \n"
    puts " Enter p to play. Enter q to quit"
    print ">"
    user_input = gets.chomp.downcase
    if user_input == "p"
      instructions
    elsif user_input == "q"
      puts "Fare thee well, Scallywag"
    else
      start_menu
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
    puts "as yous be only hav'n two ships."
    puts "The Cruiser be tree units long,"
    puts "while the submarine be two."
    puts "Here's ye map of tha game."
    puts ""
    puts "#{player.board.render}"
    puts ""
    puts "Enough jabber'n, ye landlubber! \n"
    puts "It be time to place yer ships!"
    player.place_cruiser
    puts ""
    puts "Here ye cruiser be"
    puts "#{player.board.render(true)}"
    player.place_submarine
    puts "Here ye submarine be"
    puts "Gander at ye ships below"
    puts ""
    puts "======PLAYER BOARD======"
    puts "#{player.board.render(true)}"
    puts "========================"
    puts ""
    sleep(2.5)

    turn
  end

  def turn
    computer.computer_cruiser_placement
    computer.computer_submarine_placement
    until player.has_lost? || computer.has_lost?

      puts "=====COMPUTER BOARD====="
      puts "#{computer.board.render}"
      puts "========================"
      puts " "
      puts "Computer takes a shot"
      computer.cannon_blast(player.board)
      puts " "
      puts "======PLAYER BOARD======"
      puts "#{player.board.render(true)}"
      puts "========================"
      sleep(1)
      unless player.has_lost?
        player.cannon_blast(computer.board)
      end
    end
    outcome
    start_menu
  end

  def outcome
    if !player.has_lost?
      puts "=====COMPUTER BOARD====="
      puts "#{computer.board.render}"
      puts "========================"
      puts ""
      puts "How could ya beat me computer."
      puts "🔱 🔱 🔱 YAR WIN! 🔱 🔱 🔱"
      puts ""
    else
      puts "Down to Davey Jones' locker with ya."
      puts "🦑 🦑 🦑 YAR LOST 🦑 🦑 🦑"
      puts "Me computer has won da booty!"
      puts ""
    end
  end

end
