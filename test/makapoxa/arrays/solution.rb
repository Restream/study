module Makapoxa
  module Arrays
    class << self
      def min_repeat(array)
        array
      end

      def search(array, query, left = 0, right = array.length - 1)
        return -1 if left > right
        mid = (left + right) / 2
        if array[mid] == query
          return mid
        elsif array[mid] > query
          right = mid - 1
        else
          left = mid + 1
        end
        search(array, query, left, right)
      end
    end
  end
end
