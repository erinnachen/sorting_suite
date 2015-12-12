module SortingSuite
  class BubbleSort
    attr_reader :array

    def initialize(array = [])
      @array = array
    end
    
    def sort
      length = array.length
      (length-1).times do
        (0...length-1).each do |i|
          a,b = array[i,2]
          @array[i], @array[i+1] = swap(a,b) if a > b
        end
      end
      sorted = @array
    end

    def swap(a,b)
      [b, a]
    end
  end
end
