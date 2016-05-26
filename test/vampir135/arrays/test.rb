require './test/test_helper.rb'
require_relative './solution.rb'

class Vampir135::ArraysTest < Minitest::Test

  # Заменить все положительные элементы целочисленного массива на максимальное значение элементов массива.
  def test_replace
    skip
    array = [ 3, 2, -8, 4, 100, -6, 7, 8, -99 ]
    new_array = Vampir135::Arrays.replace(array)

    assert new_array == [ 100, 100, -8, 100, 100, -6, 100, 100, -99 ]
  end

  # Реализовать бинарный поиск
  # Функция должна возвращать индекс элемента
  def test_bin_search
    skip
    assert Vampir135::Arrays.search([1], 900) == -1
    assert Vampir135::Arrays.search([1], 1) == 0
    assert Vampir135::Arrays.search([], 900) == -1
    assert Vampir135::Arrays.search([1, 4, 5, 7, 8, 9], 9) == 5
    assert Vampir135::Arrays.search([1, 4, 5, 7, 8, 9], 1) == 0
    assert Vampir135::Arrays.search([1, 4, 5, 7, 8, 9], 6) == -1

    array = (1..10000).to_a
    assert Vampir135::Arrays.search(array, array[1000]) == 1000
  end
end
