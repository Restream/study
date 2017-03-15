module Mkalmykov
  module Arrays
    class << self
      def replace(array)
        max_elem = array.max
        array.map! { |elem| elem > 0 ? max_elem : elem }
      end

      def search(array, query)
        return -1 if array.empty?

        left_edge = 0
        right_edge = array.length

        while right_edge - left_edge > 1
          # Не учитываем явно случай, когда длина массива - нечетное число,
          # потому что осуществляем целочисленное деление, и результат будет
          # целым числом
          mid = (left_edge + right_edge) / 2
          if query < array[mid]
            right_edge = mid
          else
            left_edge = mid
          end
        end
        array[left_edge] == query ? left_edge : -1
      end
    end
  end
end
