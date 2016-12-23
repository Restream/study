module Nutsoriginal
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        sum = 0
        selected = _array.select { |item| item['country'] && item['country'].split(',').length > 1 &&
                                          item['rating_kinopoisk'].to_f != 0 }
        sum = selected.map { |item| item['rating_kinopoisk'].to_f }.reduce(:+)
        sum / selected.length
      end

      def chars_count(_films, _threshold)
        selected = _films.select { |item| item['rating_kinopoisk'] && item['rating_kinopoisk'].to_f >= _threshold }
        selected.map { |item| item['name'].count('и') }.reduce(:+)
      end
    end
  end
end
