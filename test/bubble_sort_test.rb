require 'minitest'
require 'bubble_sort'

class BubbleSortTest < Minitest::Test
  def test_returns_empty_array_when_input_empty
    bs = BubbleSort.new
    assert_equal [], bs.sort([])
  end

  def test_returns_same_array_when_input_is_a_single_element
    bs = BubbleSort.new
    assert_equal ["a"], bs.sort(["a"])
  end

  def test_swaps_two_elements_correctly
    bs = BubbleSort.new
    assert_equal ["b", "a"],bs.swap("a","b")
  end

  def test_returns_two_elements_sorted_correctly_if_sorted
    bs = BubbleSort.new
    assert_equal ["a", "b"], bs.sort("ab".chars)
  end

  def test_returns_two_elements_sorted_correctly_if_unsorted
    bs = BubbleSort.new
    assert_equal ["a", "b"], bs.sort("ba".chars)
  end

  def test_sample_sort
    bs = BubbleSort.new
    to_sort = [4,2,0,3,1]
    assert_equal [0,1,2,3,4], bs.sort(to_sort)
  end

  def test_sort_elements_sorted_in_reverse
    bs = BubbleSort.new
    to_sort = (1..10).to_a.reverse
    assert_equal (1..10).to_a, bs.sort(to_sort)
  end

  def test_sort_elements_already_sorted
    bs = BubbleSort.new
    to_sort = (1..10).to_a
    assert_equal to_sort, bs.sort(to_sort)
  end

  def test_sort_a_bunch_of_elements
    bs = BubbleSort.new
    sorted = (1..100).to_a
    shuffled = sorted.shuffle
    shuffled = sorted.shuffle while shuffled == sorted
    assert_equal sorted, bs.sort(shuffled)
  end

end
