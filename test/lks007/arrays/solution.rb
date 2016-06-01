module Lks007
  module Arrays
    class << self
      def max_repeat(array)
        last_el = array.first
        max_rep = 0
        current_lenght = 0
        array.each do |x|
          if x == last_el
            current_lenght += 1
          else
            max_rep = current_lenght if current_lenght > max_rep
            current_lenght = 1
            last_el = x
          end
        end
        max_rep = current_lenght if current_lenght > max_rep
        return 0 if max_rep == 1
        max_rep
      end

      def search(array, finder)
        min = 0
        max = array.length - 1
        while min <= max
          middle_elem = (max - min) / 2 + min
          if finder < array[middle_elem]
            max = middle_elem - 1
          elsif finder > array[middle_elem]
            min = middle_elem + 1
          else
            return middle_elem
          end
        end
        -1
      end
    end
  end
end
