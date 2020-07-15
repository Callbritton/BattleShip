require 'minitest/autorun'
require 'minitest/pride'
require './lib/ships'
require './lib/cell'

class CellTest < Minitest::Test

  def test_it_has_coordiantes
    #skip
    cell = Cell.new('B4')

    assert_equal 'B4', cell.coordinate
  end

  def test_cognizant_of_empty?
    #skip
    cell = Cell.new('B4')

    assert_equal true, cell.empty?
  end


  def test_ship_occupies_cell
    #skip
    cell = Cell.new('B4')
    cruiser = Ship.new('Crusier', 3)

    assert_equal true, cell.empty?
    cell.place_ship(cruiser)
    assert_equal false, cell.empty?
    assert_equal cruiser, cell.place_ship(cruiser)
  end


  def test_it_can_fire
    #skip
    cell = Cell.new('B4')
    cruiser = Ship.new('Crusier', 3)

    cell.place_ship(cruiser)
    assert_equal 3, cruiser.health
    cell.fire_upon
    assert_equal 2, cruiser.health
  end

  def test_it_knows_if_fired_upon?
    #skip
    cell = Cell.new('B4')
    cruiser = Ship.new('Crusier', 3)
    cell2 = Cell.new('C4')

    assert_equal false, cell.fired_upon?
    cell.fire_upon
    assert_equal true, cell.fired_upon?
  end

  def test_it_renders_default_values
    #skip
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_1.place_ship(cruiser)
    assert_equal ".", cell_1.render
    assert_equal ".", cell_2.render
  end

  def test_it_renders_if_hit
    #skip
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell_1.place_ship(cruiser)
    cell_1.fire_upon
    assert_equal "H", cell_1.render
  end

  def test_it_renders_if_miss
    #skip
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell_2 = Cell.new("C4")
    submarine = Ship.new("Submarine", 2)
    cell_2.place_ship(submarine)
    cell_1.fire_upon
    assert_equal "M", cell_1.render
  end

  def test_it_renders_if_sunk
    # skip
    cell_1 = Cell.new("B1")
    cruiser = Ship.new("Cruiser", 3)

    cell_1.place_ship(cruiser)
    cell_1.fire_upon
    assert_equal false, cruiser.sunk?
    2.times do cruiser.hit end
    assert_equal "☠️", cell_1.render
    assert_equal true, cruiser.sunk?
  end


end
