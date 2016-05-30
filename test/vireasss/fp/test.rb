require 'csv'
require './test/test_helper.rb'
require_relative './solution.rb'

class Vireasss::FpTest < Minitest::Test
  # Посчитать средний рейтинг фильмов по версии кинопоиска с заданным возрастным ограничением.
  # Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.
  def test_rating
    skip
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Vireasss::Fp.rating(array, '16+')
    assert result == 2.0

    result = Vireasss::Fp.rating(array, '0+')
    assert result == 6.008823529411765
  end

  # Вычислить по странам сколько фильмов было снято за определенный год
  # disable: line/length
  def test_countries_count
    skip
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Vireasss::Fp.countries_count(array, 2012)
    assert result == { "США" => 147, "Великобритания" => 43, "Россия" => 57, "Канада" => 31, "Франция" => 6, "Бельгия" => 1, "Австралия" => 2, "Германия" => 6, "Тайвань" => 1, "ЮАР" => 3, "Индия" => 2, "Дания" => 2, "Швеция" => 2, "НоваяЗеландия" => 2, "Италия" => 27, "Украина" => 1, "ЮжнаяКорея" => 2 }

    result = Vireasss::Fp.countries_count(array, 2001)
    assert result == { "Испания" => 13, "США" => 33, "Великобритания" => 4, "Германия" => 8, "Ирландия" => 1, "Россия" => 3, "Австралия" => 2, "Канада" => 1, "НоваяЗеландия" => 1, "Италия" => 1, "Франция" => 3 }
  end
end
