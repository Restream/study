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

      def chars_count(films, threshold)
        films.reduce(0) do |accum, film|
          film['rating_kinopoisk'].to_f >= threshold.to_f ? accum + film['name'].scan(/и/i).length : accum
        end
      end
    end
  end
end
