module SortingSuite
  class MergeSort
    def sort(unsorted)
      if unsorted.length > 1
        ihalf = unsorted.length/2
        merge(sort(unsorted[0...ihalf]), sort(unsorted[ihalf..-1]))
      else
        unsorted
      end
    end

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
