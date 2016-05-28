require './test/test_helper.rb'
require_relative './solution.rb'

class User7r41n33::ArraysTest < Minitest::Test
  # Поменять местами минимальный и максимальный элементы массива
  def test_swap
    array = [3, 2, 8, 4, 1, 6, 7, 8, 9]
    new_array = User7r41n33::Arrays.swap_min_max(array)

    assert new_array == [3, 2, 8, 4, 9, 6, 7, 8, 1]
  end

  # Реализовать бинарный поиск
  # Функция должна возвращать индекс элемента
  def test_bin_search
    assert User7r41n33::Arrays.search([1], 900) == -1
    assert User7r41n33::Arrays.search([1], 1) == 0
    assert User7r41n33::Arrays.search([], 900) == -1
    assert User7r41n33::Arrays.search([1, 4, 5, 7, 8, 9], 9) == 5
    assert User7r41n33::Arrays.search([1, 4, 5, 7, 8, 9], 1) == 0
    assert User7r41n33::Arrays.search([1, 4, 5, 7, 8, 9], 6) == -1

    array = (1..10000).to_a
    assert User7r41n33::Arrays.search(array, array[1000]) == 1000
  end
end
