module Mkalmykov
  module Arrays
    class << self
      def replace(array)
        max_elem = array.max
        array.map! { |elem| elem > 0 ? max_elem : elem }
      end

      def search(array, query)
        return -1 if array.empty?

        left = 0
        right = array.length

        while right - left > 1
          # Не учитываем явно случай, когда длина массива - нечетное число,
          # потому что осуществляем целочисленное деление, и результат будет
          # целым числом
          mid = (left + right) / 2
          if query < array[mid]
            right = mid
          else
            left = mid
          end
        end
        array[left] == query ? left : -1
      end
    end
  end
end
