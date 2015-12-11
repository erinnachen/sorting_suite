require 'minitest'
require 'selection'

class SelectionTest < Minitest::Test
  def test_sort_of_empty_array_is_the_empty_array
    ssort = Selection.new
    assert_equal [], ssort.sort([])
  end

  def test_sort_of_single_element_array_is_the_same_array
    ssort = Selection.new
    assert_equal ["a"], ssort.sort(["a"])
  end

  def test_sorted_two_element_array_returns_the_same_array
    ssort = Selection.new
    assert_equal ["a","b"], ssort.sort(["a","b"])
  end

  def test_unsorted_two_element_array_returns_the_elements_flipped
    ssort = Selection.new
    assert_equal ["a","b"], ssort.sort(["b","a"])
  end

  def test_sample_sort
    ssort = Selection.new
    to_sort = [4,2,0,3,1]
    assert_equal [0,1,2,3,4], ssort.sort(to_sort)
  end

  def test_sort_a_bunch_of_elements
    ssort = Selection.new
    sorted = (1..100).to_a
    shuffled = sorted.shuffle
    shuffled = sorted.shuffle while shuffled == sorted
    assert_equal sorted, ssort.sort(shuffled)
  end

end
