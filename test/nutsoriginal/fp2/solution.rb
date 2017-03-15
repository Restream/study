module Nutsoriginal
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      def my_each
        for index in 0..(length - 1)
          yield(self[index])
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        ary = MyArray.new
        my_each { |elem| ary << yield(elem) }
        ary
      end

      # Написать свою функцию my_compact
      def my_compact
        ary = MyArray.new
        my_each { |elem| ary << elem unless elem.nil? }
        ary
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &_block)
        if acc.nil?
          acc = first
          skip_first = true
        end

        marker = nil
        my_each do |element|
          if skip_first && marker.nil?
            marker = true
          else
            acc = yield(acc, element)
          end
        end
        acc
      end
    end
  end
end
