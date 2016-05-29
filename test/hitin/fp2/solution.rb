module Hitin
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for i in self
          yield(i)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new([])
        my_each { |i| result << yield(i) }
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each { |i| result << i if i }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(sum = nil)
        arr_copy = MyArray.new(self)
        sum = sum.nil? ? arr_copy.shift : sum
        arr_copy.my_each { |i| sum = yield(i, sum) }
        sum
      end
    end
  end
end
