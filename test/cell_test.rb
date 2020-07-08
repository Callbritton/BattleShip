require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ships'
require_relative '../lib/cell'

class CellTest < Minitest::Test

  def test_it_has_coordiantes
    cell = Cell.new('B4')

    assert_equal 'B4', cell.coordinate

  end

  def test_cognizant_of_empty?
    cell = Cell.new('B4')
    
    assert_equal true, cell.empty?

  end


  def test_ship_occupies_cell
      cell = Cell.new('B4')
      cruiser = Ship.new('Crusier', 3)


      assert_equal true, cell.empty?

      cell.place_ship(cruiser)

      assert_equal false, cell.empty?

  end


end
