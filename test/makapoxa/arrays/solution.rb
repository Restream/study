module Makapoxa
  module Arrays
    class << self
      def min_repeat(array)
        current_chain = 1
        min_chain = array.length
        array.each_with_index do |value, index|
          if value == array[index - 1]
            current_chain += 1
            next
          end
          min_chain = current_chain if (min_chain > current_chain) && (current_chain != 1)
          current_chain = 1
        end
        return 0 if min_chain == 1
        min_chain
      end

      def search(array, query, left = 0, right = array.length - 1)
        return -1 if left > right
        mid = (left + right) / 2
        return mid if array[mid] == query
        if array[mid] > query
          right = mid - 1
        else
          left = mid + 1
        end
        search(array, query, left, right)
      end
    end
  end
end
