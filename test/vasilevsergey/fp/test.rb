require 'csv'
require './test/test_helper.rb'
require_relative './solution.rb'

class Vasilevsergey::FpTest < Minitest::Test

  # Посчитать средний рейтинг фильмов по версии кинопоиска с заданным возрастным ограничением.
  # Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.
  def test_rating
    skip
    array = CSV.readlines('./test/fixtures/films.csv', { headers: true })

    result = Vasilevsergey::Fp.rating(array, '16+')
    assert result == 2.0

    result = Vasilevsergey::Fp.rating(array, '0+')
    assert result == 6.008823529411765
  end

  # Посчитать количесвто букв 'г' (учитывая регистр) в названиях всех фильмов за определенный год
  def test_chars_count
    skip
    array = CSV.readlines('./test/fixtures/films.csv', { headers: true })

    result = Vasilevsergey::Fp.chars_count(array, 2013)
    assert result == 176

    result = Vasilevsergey::Fp.chars_count(array, 2001)
    assert result == 11
  end
end
