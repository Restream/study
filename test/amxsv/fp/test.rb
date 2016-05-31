require 'csv'
require './test/test_helper.rb'
require_relative './solution.rb'

class Amxsv::FpTest < Minitest::Test
  # Посчитать средний рейтинг фильмов по версии кинопоиска с заданным возрастным ограничением.
  # Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.
  def test_rating
    skip
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Amxsv::Fp.rating(array, '18+')
    assert result == 6.0135555555555555

    result = Amxsv::Fp.rating(array, '0+')
    assert result == 6.464402941176473
  end

  # Посчитать количесвто букв 'б' (учитывая регистр) в названиях всех фильмов за определенный год
  def test_chars_count
    skip
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Amxsv::Fp.chars_count(array, 2015)
    assert result == 183

    result = Amxsv::Fp.chars_count(array, 2000)
    assert result == 2
  end
end
