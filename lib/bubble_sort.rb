class BubbleSort

  def sort(unsorted)
    length = unsorted.length
    if length > 1
      length.times do
        (0...length-1).each do |i|
          a,b = unsorted[i,2]
          unsorted[i], unsorted[i+1] = swap(a,b) if wrong_order?(a,b)
        end
      end
    end
    sorted = unsorted
  end

  def swap(a,b)
    [b, a]
  end

  def wrong_order?(a,b)
    a > b
  end
end
