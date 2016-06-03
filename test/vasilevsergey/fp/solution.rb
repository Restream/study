module Vasilevsergey
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array, access_level)
        access_array = array.map { |film| film if film['access_level'] == access_level && film['rating_kinopoisk'].to_f > 0 }.compact
        rating = access_array.reduce(0) { |a, e| a + e['rating_kinopoisk'].to_f }
        rating / access_array.size
      end

      def chars_count(films, year)
        films.reduce(0) { |a, e| (e['year'].to_i == year) ? a + e['name'].count('г') : a }
      end
    end
  end
end
