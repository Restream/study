module Mkalmykov
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        required_films = array.select { |film| !film['country'].nil? && film['country'].split(',').length >= 2 && !film['rating_kinopoisk'].to_f.zero? }
                              .map { |film| film['rating_kinopoisk'].to_f }

        required_films.reduce { |a, e| a + e } / required_films.length
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
