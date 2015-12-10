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

  def test_returns_two_elements_sorted_correctly
    bs = BubbleSort.new
    assert_equal ["a", "b"], bs.sort("ab".chars)
    assert_equal ["a", "b"], bs.sort("ba".chars)
  end



end
