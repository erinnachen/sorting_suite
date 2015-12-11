class MergeSort
  def sort(unsorted)
    if unsorted.length > 1
      nhalf = unsorted.length/2
      merge(sort(unsorted[0..nhalf-1]), sort(unsorted[nhalf..-1]))
    else
      unsorted
    end
  end

  def merge(sorted1,sorted2)
    merged = []
    i1 = 0
    i2 = 0
    while i1 < sorted1.length && i2 < sorted2.length
      if sorted1[i1] < sorted2[i2]
        merged << sorted1[i1]
        i1 += 1
      else
        merged << sorted2[i2]
        i2 += 1
      end
    end
    if i1 < sorted1.length
      merged+=sorted1[i1..-1]
    else
      merged+=sorted2[i2..-1]
    end
    merged
  end


end
