class Game

  def initialize
    @start = start

  end


  def start
    p " ⚓⚓⚓ Welcome to BATTLESHIP ⚓⚓⚓ \n"
    p " Enter p to play. Enter q to quit"

      until @play == "p"

        print ">"
        @play = gets.chomp.downcase
      end
    end

end
