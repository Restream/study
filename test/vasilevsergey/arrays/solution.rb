module Vasilevsergey
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |elem| elem > 0 ? max : elem }
      end

      def search(array, query, left = 0, right = array.length - 1)
        return -1 if left > right
        middle = (left + right) / 2
        return middle if array[middle] == query
        if array[middle] > query
          right = middle - 1
        else
          left = middle + 1
        end
        search(array, query, left, right)
      end
    end
  end
end
