require './test/test_helper.rb'
require_relative './solution.rb'

class Hitin::ArraysTest < Minitest::Test

  # Осуществить сдвиг элементов массива вправо на N позиций.
  def test_move
    skip
    array = [ 3, 4, 6, 4, 1, 1, 1, 7, 8 ]

    assert Hitin::Arrays.move(array, 0) == array
    assert Hitin::Arrays.move(array, 9) == array
    assert Hitin::Arrays.move(array, 1) == [ 8, 3, 4, 6, 4, 1, 1, 1, 7  ]
    assert Hitin::Arrays.move(array, 3) == [ 1, 7, 8, 3, 4, 6, 4, 1, 1  ]
  end

  # Реализовать бинарный поиск
  # Функция должна возвращать индекс элемента
  def test_bin_search
    skip
    assert Hitin::Arrays.search([1], 900) == -1
    assert Hitin::Arrays.search([1], 1) == 0
    assert Hitin::Arrays.search([], 900) == -1
    assert Hitin::Arrays.search([1, 4, 5, 7, 8, 9], 9) == 5
    assert Hitin::Arrays.search([1, 4, 5, 7, 8, 9], 1) == 0
    assert Hitin::Arrays.search([1, 4, 5, 7, 8, 9], 6) == -1

    array = (1..10000).to_a
    assert Hitin::Arrays.search(array, array[1000]) == 1000
  end
end
