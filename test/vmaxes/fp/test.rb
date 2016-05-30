require 'csv'
require './test/test_helper.rb'
require_relative './solution.rb'

class Vmaxes::FpTest < Minitest::Test

  # Посчитать средний рейтинг фильмов по версии кинопоиска с заданным возрастным ограничением.
  # Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.
  def test_rating
    skip
    array = CSV.readlines('./test/fixtures/films.csv', { headers: true })

    result = Vmaxes::Fp.rating(array, '16+')
    assert result == 2.0

    result = Vmaxes::Fp.rating(array, '0+')
    assert result == 6.008823529411765
  end

  # Вычислить по странам сколько фильмов было снято за определенный год
  def test_countries_count
    skip
    array = CSV.readlines('./test/fixtures/films.csv', { headers: true })

    result = Vmaxes::Fp.countries_count(array, 2003)
    assert result == {"Канада"=>3, "США"=>42, "Россия"=>5, "Великобритания"=>5, "Германия"=>7, "Испания"=>2, "Италия"=>1, "НоваяЗеландия"=>1, "Австралия"=>2, "Франция"=>2, "Япония"=>1}

    result = Vmaxes::Fp.countries_count(array, 2001)
    assert result == {"Испания"=>13, "США"=>33, "Великобритания"=>4, "Германия"=>8, "Ирландия"=>1, "Россия"=>3, "Австралия"=>2, "Канада"=>1, "НоваяЗеландия"=>1, "Италия"=>1, "Франция"=>3}
  end
end
