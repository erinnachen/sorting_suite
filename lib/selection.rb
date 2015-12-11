class Selection
  def sort(unsorted_in)
    unsorted = unsorted_in.clone
    sorted = []
    while still_unsorted?(unsorted)
      sorted << get_smallest_element(unsorted)
    end
    sorted
  end

  def still_unsorted?(unsorted)
    !unsorted.empty?
  end

  def get_smallest_element(unsorted)
    smallest = unsorted[0]
    unsorted.each do |element|
      smallest = element if element < smallest
    end
    unsorted.delete_at(unsorted.index(smallest))
  end
  
end
