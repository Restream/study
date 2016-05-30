module Makapoxa
  module Arrays
    class << self
      def min_repeat(array)
        return 0 if array.length < 2
        res = []
        temp = [array.first]
        array.each_with_index do |value, index|
          next if index.zero?
          if (value == array[index - 1])
            temp << value
          else
            if temp.length > 1
              res << temp
            end
            temp = [value]
          end
        end
        if temp.length > 1
          res << temp
        end
        res.min{|a, b| a.length <=> b.length}.length
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
