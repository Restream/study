module Amxsv
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for item in self
          yield(item)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result_arr = MyArray.new
        my_each do |item|
          result_arr << yield(item)
        end
        result_arr
      end

      # Написать свою функцию my_compact
      def my_compact
        result_arr = MyArray.new
        my_each do |item|
          result_arr << item if item
        end
        result_arr
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        acc, *tail = acc.nil? ? self : [acc, *self]
        for item in tail
          acc = yield(acc, item)
        end
        acc
      end
    end
  end
end
