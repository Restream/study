require 'csv'
require './test/test_helper.rb'
require_relative './solution.rb'

class Makapoxa::FpTest < Minitest::Test
  # Посчитать средний рейтинг фильмов по версии imdb из заданной страны
  # Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.
  def test_rating
    skip
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Makapoxa::Fp.rating(array, 'Франция')
    assert result == 6.563999999999998

    result = Makapoxa::Fp.rating(array, 'США')
    assert result == 6.509462086843813
  end

  # Посчитать количесвто точек в названиях всех фильмов за определенный год
  def test_chars_count
    skip
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Makapoxa::Fp.chars_count(array, 2013)
    assert result == 272

    result = Makapoxa::Fp.chars_count(array, 2005)
    assert result == 66
  end
end
