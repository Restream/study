module Hitin
  module Arrays
    class << self
      def move(array, n)
        shift = n % array.size
        new_array = []
        array.each_index do |i|
          tmp = array[i]
          sd = i + shift
          res = sd >= array.size ? sd - array.size : sd
          new_array[res] = tmp
        end
        new_array
      end

      def search(array, query)
        first_ind = 0
        last_ind = array.count - 1
        mid = (last_ind / 2).to_i
        (array.count == 1) && (array[0] != query) ? -1 : 0
        while (array[mid] != query) && (first_ind <= last_ind)
          if array[mid] > query
            last_ind = mid - 1
            mid = last_ind / 2
          else
            first_ind = mid + 1
            mid = (last_ind + first_ind) / 2
          end
          return -1 if first_ind > last_ind
        end
        mid
      end
    end
  end
end
