module Amxsv
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array, access_level)
        result_array = array.select { |film| film['access_level'] == access_level && !film['rating_kinopoisk'].to_f.zero? }
                            .map { |film| film['rating_kinopoisk'].to_f }
        result_array.reduce(:+) / result_array.size
      end

      def chars_count(films, year)
        films.reduce(0) do |acc, film|
          (film['year'].to_i == year) ? (acc + film['name'].count('б')) : acc
        end
      end
    end
  end
end
