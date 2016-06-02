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
        my_each do |e|
          my_result << yield(e)
        end
        my_result
      end

      # Написать свою функцию my_compact
      def my_compact
        my_result = MyArray.new([])
        my_each do |e|
          my_result << e if e
        end
        my_result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        shift = acc.nil? ? 1 : 0
        acc = acc.nil? ? self[0] : acc
        drop(shift).my_each do |e|
          acc = yield(acc, e)
        end
        acc
      end
    end
  end
end
