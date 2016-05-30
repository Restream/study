module Nmorozov
  module Arrays
    class << self
      def replace(array)
        array_max = array.max
        array.map { |e| e > 0 ? array_max : e }
      end

      def search(array, query)
        index = -1

        return index if array.empty?

        bottom = 0
        top = array.length

        while bottom < top
          mid = bottom + (top - bottom) / 2
          return mid if query == array[mid]

          if query < array[mid]
            top = mid
          else
            bottom = mid + 1
          end
        end

        index
      end
    end
  end
end
