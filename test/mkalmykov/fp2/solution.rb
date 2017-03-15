module Mkalmykov
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for element in self
          yield element
        end
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new

        if block_given?
          my_each { |elem| result << yield(elem) }
        else
          result = to_enum :my_map
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new

        for element in self
          result << element unless element.nil?
        end
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(accumulator = self[0])
        my_each do |element|
          accumulator = yield(accumulator, element)
        end
        accumulator
      end
    end
  end
end
