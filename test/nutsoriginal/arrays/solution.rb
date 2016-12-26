module Nutsoriginal
  module Arrays
    class << self
      # Заменить все положительные элементы целочисленного массива на максимальное значение элементов массива.
      def replace(array)
        max = array.max
        array.map { |elem| elem.positive? ? max : elem }
      end

      # Реализовать бинарный поиск
      # Функция должна возвращать индекс элемента
      def search(array, query)
        ind = 0
        len = array.length
        while (len - ind) > 1
          mid = (ind + len) / 2
          if query < array[mid]
            len = mid
          else
            ind = mid
          end
        end
        if array[ind] == query
          ind
        else
          -1
        end
      end
    end
  end
end
