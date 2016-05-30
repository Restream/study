require './test/test_helper.rb'
require_relative './solution.rb'

class Lks007::ArraysTest < Minitest::Test
  # Найти длинну максимального промежутка с повторяющимися значениями
  def test_max_repeat
    assert Lks007::Arrays.max_repeat([1]) == 0
    assert Lks007::Arrays.max_repeat([1, 2]) == 0
    assert Lks007::Arrays.max_repeat([1, 1]) == 2
    assert Lks007::Arrays.max_repeat([1, 1, 2, 2, 2, 4, 5, 6, 6, 6, 6, 1, 3, 4, 5, 5]) == 4
    assert Lks007::Arrays.max_repeat([1, 1, nil, nil, nil, 4, 5, 6, 8, 6, 60, 1, 3, 4, 5, 5]) == 3
  end

  # Реализовать бинарный поиск
  # Функция должна возвращать индекс элемента
  def test_bin_search
    assert Lks007::Arrays.search([1], 900) == -1
    assert Lks007::Arrays.search([1], 1) == 0
    assert Lks007::Arrays.search([], 900) == -1
    assert Lks007::Arrays.search([1, 4, 5, 7, 8, 9], 9) == 5
    assert Lks007::Arrays.search([1, 4, 5, 7, 8, 9], 1) == 0
    assert Lks007::Arrays.search([1, 4, 5, 7, 8, 9], 6) == -1

    array = (1..10000).to_a
    assert Lks007::Arrays.search(array, array[1000]) == 1000
  end
end
