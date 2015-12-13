module SortingSuite
  class MergeSort
    attr_reader :array
    def initialize(array =[])
      @array = array
    end

    def sort
      _sort_recursive(array)
    end

    def _sort_recursive(unsorted)
      if unsorted.length > 1
        ihalf = unsorted.length/2
        merge(_sort_recursive(unsorted[0...ihalf]), _sort_recursive(unsorted[ihalf..-1]))
      else
        unsorted
      end
    end
    private :_sort_recursive

    def merge(sorted1,sorted2)
      merged = []
      until sorted1.empty? || sorted2.empty?
        if sorted1[0] < sorted2[0]
          merged << sorted1.shift
        else
          merged << sorted2.shift
        end
      end
      merged+sorted1+sorted2
    end
  end
end
