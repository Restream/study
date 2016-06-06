module Lks007
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for elem in self
          yield(elem)
        end
      end

      # Написать свою функцию my_map
      def my_map
        map_return = MyArray.new
        for elem in self
          map_return.push(yield(elem))
        end
        map_return
      end

      # Написать свою функцию my_compact
      def my_compact
        compact_return = MyArray.new
        for elem in self
          compact_return.push(elem) if elem
        end
        compact_return
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        for elem in self
          acc = acc ? yield(acc, elem) : elem
        end
        acc
      end
    end
  end
end
