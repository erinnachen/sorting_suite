class InsertionSort
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

end
