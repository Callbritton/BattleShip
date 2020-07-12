require 'minitest/autorun'
require 'minitest/pride'
require './lib/ships'

class ShipTest < Minitest::Test

  def test_it_exists
    # skip
    ship = Ship.new('Crusier', 3)

    assert_instance_of Ship, ship

  end


  def test_it_has_a_name
    # skip
    ship = Ship.new('Crusier', 3)

    assert_equal 'Crusier', ship.name

  end

  def test_it_has_health
    # skip
    ship1 = Ship.new('Crusier', 3)
    ship2 = Ship.new('Sub', 2)


    assert_equal 3, ship1.health
    assert_equal 2, ship2.health
  end

  def test_it_can_take_a_hit
    # skip
    ship = Ship.new('Crusier', 3)

    ship.hit
    assert_equal 2, ship.health
    ship.hit
    assert_equal 1, ship.health
    ship.hit
    assert_equal 0, ship.health
  end

  def test_it_can_sink
    # skip
    ship = Ship.new('Crusier', 3)

    ship.hit
    assert_equal 2, ship.health
    ship.hit
    assert_equal 1, ship.health
    ship.hit
    assert_equal 0, ship.health

    assert_equal true, ship.sunk?
  end

end
