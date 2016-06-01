module Lks007
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array, access_level)
        film_withreit = array.select { |film| film['access_level'].to_i == access_level.to_i && film['rating_imdb'].to_i != 0 }
        film_withreit.reduce(0) { |a, e| a + e['rating_imdb'].to_f } / film_withreit.length
      end

      def chars_count(films, year)
        films_needsyear = films.select { |film| film['year'].to_i == year }
        films_needsyear.reduce(0) { |a, e| a + e['name'].scan(/[0-9]/).length }
      end
    end
  end
end
