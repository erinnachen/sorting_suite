module SortingSuite
  class BubbleSort
    attr_reader :array

    def initialize(array = [])
      @array = array
    end

    def sort
      sorted = array
      length = sorted.length
      (length-1).times do
        (0...length-1).each do |i|
          a,b = array[i,2]
          sorted[i], sorted[i+1] = swap(a,b) if a > b
        end
      end
      sorted
    end

    def swap(a,b)
      [b, a]
    end
  end
end
