require 'csv'
require './test/test_helper.rb'
require_relative './solution.rb'

class User7r41n33::FpTest < Minitest::Test
  # Написать функцию расчета среднего рейтинга кинопоиска всех фильмов за заданный год.
  # Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.
  def test_rating
    skip
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = User7r41n33::Fp.rating(array, 2016)
    assert result == 5.891394736842104

    result = User7r41n33::Fp.rating(array, 2000)
    assert result == 7.4038125
  end

  # Посчитать количесвто букв 'а' (учитывая регистр) в названиях всех фильмов
  # с заданным возрастным ограничением.
  def test_chars_count
    skip
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = User7r41n33::Fp.chars_count(array, '18+')
    assert result == 203

    result = User7r41n33::Fp.chars_count(array, '0+')
    assert result == 6653
  end
end
