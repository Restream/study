require 'csv'
require './test/test_helper.rb'
require_relative './solution.rb'

class Vampir135::FpTest < Minitest::Test
  # Посчитать средний рейтинг фильмов по версии кинопоиска у которых две или больше стран
  # Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.
  def test_rating
    skip
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Vampir135::Fp.rating(array)
    assert result == 5.483870967741935
  end

  # Посчитать количесвто букв 'и' в названиях всех фильмов с рейтингом кинопоиска больше или равным заданному значению
  def test_chars_count
    skip
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Vampir135::Fp.chars_count(array, 5)
    assert result == 891

    result = Vampir135::Fp.chars_count(array, 8.5)
    assert result == 1
  end
end
