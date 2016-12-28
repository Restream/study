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
        index = 0
        len = array.length
        while (len - index) > 1
          mid = (index + len) / 2
          if query < array[mid]
            len = mid
          else
            index = mid
          end
        end
        if array[index] == query
          index
        else
          -1
        end
      end
    end
  end
end
