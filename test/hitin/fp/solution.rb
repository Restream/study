module Hitin
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array, access_level)
        mas_rating = array.select { |film| film['access_level'] == access_level && !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'] != '0' }
        mas_rating = mas_rating.map { |film| film['rating_kinopoisk'].to_f }
        mas_rating.reduce(:+) / mas_rating.size
      end

      def chars_count(films, year)
        movies_for_the_year = films.select { |film| film['year'].to_i == year }
        movies_with_number = movies_for_the_year.map { |film| film['name'].scan(/[0-9]/).count }
        movies_with_number.reduce(:+)
      end
    end
  end
end
