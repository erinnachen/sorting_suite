class InsertionSort
  attr_reader :array
  def initialize(array = [])
    @array = array
  end

  def sort(unsorted)
    sorted = []
    unsorted.each do |element|
      ind = 0
      while ind < sorted.length && element > sorted[ind]
        ind+=1
      end
      sorted.insert(ind,element)
    end
    sorted
  end

  def inplace_sort
    sort_ind = 1
    while sort_ind < array.length
      to_be_sorted = array[sort_ind]
      insert_ind = find_insert_ind(sort_ind)
      sort_ind.downto(insert_ind+1) do |ind|
        array[ind] = array[ind-1]
      end
      array[insert_ind] = to_be_sorted
      sort_ind += 1
    end
    array
  end

  def find_insert_ind(sort_ind)
    val = array[sort_ind]
    insert_ind = sort_ind
    while insert_ind > 0 && val < array[insert_ind-1]
      insert_ind -= 1
    end
    insert_ind
  end
end
