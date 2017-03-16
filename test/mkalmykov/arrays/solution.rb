module Mkalmykov
  module Arrays
    class << self
      def replace(array)
        max_elem = array.max
        array.map! { |elem| elem > 0 ? max_elem : elem }
      end

      def search(array, query)
        binary_search(array, query)
      end

      private

      def binary_search(array, query, from = 0, to = array.length - 1)
        return -1 if array.empty?

        mid = (from + to) / 2
        value = array[mid]

        if to == from
          query == array[from] ? from : -1
        elsif value < query
          binary_search(array, query, mid + 1, to)
        elsif value > query
          binary_search(array, query, from, mid - 1)
        else
          mid
        end
      end
    end
  end
end
