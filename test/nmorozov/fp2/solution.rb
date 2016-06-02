module Nmorozov
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for i in self
          yield(i)
        end
      end

      # Написать свою функцию my_map
      def my_map
        my_result = MyArray.new([])
        for i in self
          my_result << yield(i)
        end
        my_result
      end

      # Написать свою функцию my_compact
      def my_compact
        my_result = MyArray.new([])
        for i in self
          my_result << i unless i.nil?
        end
        my_result
      end

      # Написать свою функцию my_reduce
      def my_reduce(accumulator = nil)
        if accumulator.nil?
          accumulator = self[0]
          for i in self[1..count - 1]
            accumulator = yield(accumulator, i)
          end
        else
          for i in self
            accumulator = yield(accumulator, i)
          end
        end
        accumulator
      end
    end
  end
end
