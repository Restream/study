module Makapoxa
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array, country)
        selection = array.select { |film| !film['country'].nil? && film['country'].include?(country) && !film['rating_imdb'].to_f.zero? }
                         .map { |film| film['rating_imdb'].to_f }
        selection.reduce(:+) / selection.length
      end

      def chars_count(films, year)
        films.select { |film| film['year'].to_i == year }.map { |film| film['name'] }.reduce(0) { |a, e| a + e.scan(/\./).count }
      end
    end
  end
end
