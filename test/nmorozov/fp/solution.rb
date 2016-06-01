module Nmorozov
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film['name'], film['rating_kinopoisk'], film['rating_imdb'],
      # film['genres'], film['year'], film['access_level'], film['country']
      def rating(array)
        return 0 if array.empty?

        s_a = array.select { |film| film['country'].to_s.split(',').size >= 2 && film['rating_imdb'].to_f > 0.0 }
                   .map { |film| film['rating_imdb'].to_f }

        s_a.reduce(:+) / s_a.size
      end

      def chars_count(films, threshold)
        return 0 if films.empty?

        films.select { |film| film['rating_imdb'].to_f >= threshold.to_f }
             .map { |film| film['name'] }
             .reduce(0) { |a, e| a + e.scan(/[Вв]/).length }
      end
    end
  end
end
