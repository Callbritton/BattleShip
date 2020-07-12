class Ship
  attr_reader :name, :length

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end
# This creates a method that can be called that will look
# at @health which has been initialized and set to a ship's length.
# This will cause all ship objects created to start with the appropriate amount
# of health for their size.
  def health
    @health
  end
# This will "hit" the ship decrementing it's health by 1 per hit.
  def hit
    @health -= 1
  end
# This will return true if a ship's health is reduced to 0.
  def sunk?
    @health == 0
  end
end
