require './test/test_helper.rb'
require_relative './solution.rb'

class Vireasss::ArraysTest < Minitest::Test
  # Заменить все отрицательные элементы целочисленного массива на минимальное значение элементов массива.
  def test_replace
    skip
    array = [3, 2, -8, 4, 1, -6, 7, 8, -99]
    new_array = Vireasss::Arrays.replace(array)

    assert new_array == [3, 2, -99, 4, 9, -99, 7, 8, -99]
  end

  # Реализовать бинарный поиск
  # Функция должна возвращать индекс элемента
  def test_bin_search
    skip
    assert Vireasss::Arrays.search([1], 900) == -1
    assert Vireasss::Arrays.search([1], 1) == 0
    assert Vireasss::Arrays.search([], 900) == -1
    assert Vireasss::Arrays.search([1, 4, 5, 7, 8, 9], 9) == 5
    assert Vireasss::Arrays.search([1, 4, 5, 7, 8, 9], 1) == 0
    assert Vireasss::Arrays.search([1, 4, 5, 7, 8, 9], 6) == -1

    array = (1..10000).to_a
    assert Vireasss::Arrays.search(array, array[1000]) == 1000
  end
end
