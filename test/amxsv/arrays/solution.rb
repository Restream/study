module Amxsv
  module Arrays
    class << self
      def replace(array)
        min_elem = array.min
        array.map { |elem| elem < 0 ? min_elem : elem }
      end

      def search(array, query, to=0, from=array.length-1)
        if array.empty?
          return -1
        end

        if to == from
          return query == array[from] ? from : -1
        end

        mid = to + (from - to) / 2

        if query > array[mid]
          search(array, query, mid + 1, from)
        else
          search(array, query, to, mid)
        end
      end
    end
  end
end
