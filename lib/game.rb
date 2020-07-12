# require './lib/ships'
# require './lib/cell'
# require './lib/board'

class Game

  def initialize
    @start = start
  end


  def start
    p " ⚓⚓⚓ Welcome to BATTLESHIP ⚓⚓⚓ \n"
    p " Enter p to play. Enter q to quit"

      while @play ==

        print ">"
        @play = gets.chomp.downcase
        if @play == "p"

          ## Who wants to sit through instructions when they
          ##play again?
          #place computer ships.
          place_computer_ships
          instructions
          #input from player to place ships
        end

      end
    end

    def instructions
      puts "🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️🏴‍☠️"
      puts "Ahoy Matey! \n"
      puts "Place ye ships wisely as there be only two \n"
      puts "The Cruiser be three units long, \n"
      puts "while the submarine be two. \n"
      puts "The game board is below. \n"
      puts "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
      puts "Avast, ye landlubber! \n"
      puts "Give me tree cor'nates, \n"
      puts "and make true they be ascending"
      puts ">"
      require "pry"; binding.pry
    end

    def place_computer_ships

    end
end
