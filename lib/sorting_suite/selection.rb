module SortingSuite
  class Selection
    attr_reader :array

    def initialize(array = [])
      @array = array
    end

    def sort
      unsorted = array.clone
      sorted = []
      until unsorted.empty?
        sorted << remove_smallest_element(unsorted)
      end
      sorted
    end

    def remove_smallest_element(unsorted)
      smallest = unsorted.min
      unsorted.delete_at(unsorted.index(smallest))
    end
  end
end
