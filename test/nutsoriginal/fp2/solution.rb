module Nutsoriginal
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      def my_each
        for ind in 0..(length - 1)
          yield(self[ind])
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
      def my_reduce(acc = nil, &block)
        if acc.nil?
          acc = first
          skip_frst = true
        end
        i = 0
        my_each do |element|
          unless skip_frst && i == 0
            acc = block.call(acc, element)
          end
          i += 1
        end
        acc
      end
    end
  end
end
