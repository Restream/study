require 'csv'
require './test/test_helper.rb'
require_relative './solution.rb'

class Nmorozov::FpTest < Minitest::Test
  # Посчитать средний рейтинг фильмов по версии imdb у которых две или больше стран
  # Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.
  def test_rating
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Nmorozov::Fp.rating(array)
    assert result == 6.583282674772023
  end

  # Посчитать количесвто букв 'в' в названиях всех фильмов с рейтингом imdb больше или равным заданному значению
  def test_chars_count
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Nmorozov::Fp.chars_count(array, 5)
    assert result == 1820

    result = Nmorozov::Fp.chars_count(array, 8.5)
    assert result == 23
  end
end
