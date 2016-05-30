require 'csv'
require './test/test_helper.rb'
require_relative './solution.rb'

class Hitin::FpTest < Minitest::Test

  # Посчитать средний рейтинг фильмов по версии кинопоиска с заданным возрастным ограничением.
  # Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.
  def test_rating
    skip
    array = CSV.readlines('./test/fixtures/films.csv', { headers: true })

    result = Hitin::Fp.rating(array, '18+')
    assert result == 5.555555555555555

    result = Hitin::Fp.rating(array, '0+')
    assert result == 6.008823529411765
  end

  # Посчитать количесвто цифр в названиях всех фильмов за определенный год
  def test_chars_count
    skip
    array = CSV.readlines('./test/fixtures/films.csv', { headers: true })

    result = Hitin::Fp.chars_count(array, 2003)
    assert result == 29

    result = Hitin::Fp.chars_count(array, 2005)
    assert result == 11
  end
end
