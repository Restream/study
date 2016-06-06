module User7r41n33
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for e in self
          yield(e)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = self.class.new
        for i in 0..size - 1
          result[i] = yield(self[i])
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = self.class.new
        my_each { |e| result << e if e }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        self_copy = self.class.new(self)
        acc = self_copy.shift if acc.nil?

        self_copy.my_each { |e| acc = yield(acc, e) }
        acc
      end
    end
  end
end
