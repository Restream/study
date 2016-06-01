module User7r41n33
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["al"], film["country"]
      def rating(films, year)
        compact_films = films.map { |film| film if film['year'].to_i == year && film['rating_kinopoisk'].to_f > 0 }
                             .compact
        total = compact_films.reduce(0) { |a, e| a + e['rating_kinopoisk'].to_f }
        (total / compact_films.size).to_f
      end

      def chars_count(films, access_level)
        films.reduce(0) do |count, film|
          film['access_level'] == access_level ? count + film['name'].count('а') : count
        end
      end
    end
  end
end
