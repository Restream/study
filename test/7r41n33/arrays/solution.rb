module User7r41n33
  module Arrays
    class << self
      def swap_min_max(array)
        min_index = 0
        max_index = 0

        array.each_index do |i|
          min_index = i if array[i] < array[min_index]
          max_index = i if array[i] > array[max_index]
        end

        tmp = array[min_index]
        array[min_index] = array[max_index]
        array[max_index] = tmp
        array
      end

      def search(array, query)
        return -1 if array.empty?

        left_index = 0
        right_index = array.size - 1

        return left_index if array[left_index] == query
        return right_index if array[right_index] == query

        while left_index < right_index
          current_index = (left_index + right_index) / 2
          return current_index if array[current_index] == query

          if query < array[current_index]
            right_index = current_index
          else
            left_index = current_index + 1
          end
        end

        -1
      end
    end
  end
end
