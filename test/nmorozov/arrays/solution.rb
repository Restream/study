module Nmorozov
  module Arrays
    class << self
      def replace(array)
        array.map { |e| e > 0 ? array.max : e }
      end

      def search(array, query)
        index = -1

        unless (array.empty?)
          bottom = 0
          top = array.length

          while bottom < top do
            mid = bottom + (top - bottom) / 2
            if query == array[mid]
              index = mid
              break
            else
              if query < array[mid]
                top = mid
              else
                bottom = mid + 1
              end
            end
          end
        end

        index
      end
    end
  end
end
