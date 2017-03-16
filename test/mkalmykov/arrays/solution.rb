module Mkalmykov
  module Arrays
    class << self
      def replace(array)
        max_elem = array.max
        array.map { |elem| elem > 0 ? max_elem : elem }
      end

      def search(array, query)
        binary_search(array, query)
      end

      private

      def binary_search(array, query, from = 0, to = array.length - 1)
        return -1 if array.empty?
        return query == array[from] ? from : -1 if to == from

        mid = (from + to) / 2
        value = array[mid]

        return mid if value == query

        if value < query
          from = mid + 1
        elsif value > query
          to = mid - 1
        end

        binary_search(array, query, from, to)
      end
    end
  end
end
