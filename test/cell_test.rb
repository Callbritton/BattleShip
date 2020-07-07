require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ships'
require_relative '../lib/cell'

class CellTest < Minitest::Test

  def test_it_has_coordiantes
    cell = Cell.new('B4')

    assert_equal 'B4', cell.coordinate

  end



end
