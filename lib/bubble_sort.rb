class BubbleSort

  def sort(unsorted)
    if unsorted.length > 1
      unsorted = swap(unsorted[0],unsorted[1]) if unsorted[0] > unsorted[1]
    end
    unsorted
  end

  def swap(a,b)
    [b, a]
  end

end

bs = BubbleSort.new
puts bs.sort("ba".chars).inspect
