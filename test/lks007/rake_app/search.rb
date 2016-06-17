module Search
  def self.search(array, finder)
    min = 0
    max = array.length - 1
    while min <= max
      middle_elem = (max - min) / 2 + min
      if finder < array[middle_elem]
        max = middle_elem - 1
      elsif finder > array[middle_elem]
        min = middle_elem + 1
      else
        return middle_elem
      end
    end
    -1
  end
end
