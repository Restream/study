require './test/test_helper.rb'
require_relative './solution.rb'

class Mkalmykov::ArraysTest < Minitest::Test
  # Заменить все положительные элементы целочисленного массива на максимальное значение элементов массива.
  def test_replace
    array = [3, 2, -8, 4, 100, -6, 7, 8, -99]
    new_array = Mkalmykov::Arrays.replace(array)

    assert new_array == [100, 100, -8, 100, 100, -6, 100, 100, -99]
  end

  # Реализовать бинарный поиск
  # Функция должна возвращать индекс элемента
  def test_bin_search
    assert Mkalmykov::Arrays.search([1], 900) == -1
    assert Mkalmykov::Arrays.search([1], 1) == 0
    assert Mkalmykov::Arrays.search([], 900) == -1
    assert Mkalmykov::Arrays.search([1, 4, 5, 7, 8, 9], 9) == 5
    assert Mkalmykov::Arrays.search([1, 4, 5, 7, 8, 9], 1) == 0
    assert Mkalmykov::Arrays.search([1, 4, 5, 7, 8, 9], 6) == -1

    array = (1..10000).to_a
    assert Mkalmykov::Arrays.search(array, array[1000]) == 1000
  end
end
