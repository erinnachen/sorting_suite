module SortingSuite
  class BubbleSort
    def sort(unsorted)
      length = unsorted.length
      (length-1).times do
        (0...length-1).each do |i|
          a,b = unsorted[i,2]
          unsorted[i], unsorted[i+1] = swap(a,b) if a > b
        end
      end
      sorted = unsorted
    end

    def swap(a,b)
      [b, a]
    end
  end
end
