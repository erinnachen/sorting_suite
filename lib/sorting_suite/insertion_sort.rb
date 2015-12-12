module SortingSuite
  class InsertionSort
    attr_reader :array
    def initialize(array = [])
      @array = array
    end

    def sort
      sorted = []
      array.each do |value|
        index = find_index_for_insertion(sorted,value)
        sorted.insert(index,value)
      end
      sorted
    end

    def find_index_for_insertion(sorted,insert_value)
      ind = sorted.index {|i| i > insert_value}
      if ind.nil?
        sorted.length
      else
        ind
      end
    end


    def inplace_sort
      array.each_with_index do |value, current_ind|
        insert_ind = find_insert_ind(current_ind)
        array.delete_at(current_ind)
        array.insert(insert_ind, value)
      end
    end

    def find_insert_ind(current_ind)
      to_sort = array[current_ind]
      insert_ind = array[0...current_ind].index {|sorted| sorted > to_sort}
      if insert_ind.nil?
        insert_ind = current_ind
      end
      insert_ind
    end
  end
end
