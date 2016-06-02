module Makapoxa
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
        res = MyArray.new
        my_each do |item|
          res << yield(item)
        end
        res
      end

      # Написать свою функцию my_compact
      def my_compact
        res = MyArray.new
        my_each do |item|
          res << item if item
        end
        res
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, operation = nil, &block)
        drop = 0
        if acc.nil?
          drop = 1
          acc = first
        end
        op = operation.nil? ? block : (-> (accumulator, value) { accumulator.send(operation, value) })
        drop(drop).my_each do |item|
          acc = op.call(acc, item)
        end
        acc
      end
    end
  end
end
