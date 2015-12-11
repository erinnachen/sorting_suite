require 'minitest'
require 'merge_sort'

class MergeSortTest < Minitest::Test
  def test_sort_of_empty_array_is_the_empty_array
    msort = MergeSort.new
    assert_equal [], msort.sort([])
  end

  def test_sort_of_single_element_array_is_the_same_array
    msort = MergeSort.new
    assert_equal ["e"], msort.sort(["e"])
  end

  def test_can_merge_two_single_element_arrays_already_sorted
    msort = MergeSort.new
    assert_equal ["a","b"], msort.merge(["a"],["b"])

  end

  def test_can_merge_two_single_element_arrays_unsorted
    msort = MergeSort.new
    assert_equal ["a","b"], msort.merge(["b"],["a"])
  end

  def test_can_merge_arrays_with_two_different_sizes_right_longer_than_left
    msort = MergeSort.new
    assert_equal "abcdefgh".chars,
    msort.merge("ab".chars,"cdefgh".chars)
  end

  def test_can_merge_arrays_with_two_different_sizes_right_longer_than_left
    msort = MergeSort.new
    assert_equal "abcdefgh".chars,
    msort.merge("abcdef".chars,"gh".chars)
  end

  def test_can_merge_two_element_arrays_all_left_elements_les_than_all_right_elements
    msort = MergeSort.new
    assert_equal "abcdefghi".chars, msort.merge("abcde".chars,"fghi".chars)
  end

  def test_can_merge_two_element_arrays_all_right_elements_les_than_all_left_elements
    msort = MergeSort.new
    assert_equal "abcdefghi".chars, msort.merge("fghi".chars,"abcde".chars)
  end

  def test_can_merge_two_element_arrays_where_elements_need_to_be_interlaced_alternating
    msort = MergeSort.new
    assert_equal "abcdefghi".chars, msort.merge("aceg".chars,"bdfhi".chars)
  end

  def test_can_merge_two_element_arrays_where_elements_need_to_be_interlaced_not_alternating
    msort = MergeSort.new
    assert_equal "abcdefghi".chars, msort.merge("acdeghi".chars,"bf".chars)
  end

  def test_sorted_two_element_array_returns_the_same_array
    msort = MergeSort.new
    assert_equal ["a","b"], msort.sort(["a","b"])
  end

  def test_unsorted_two_element_array_returns_the_elements_flipped
    msort = MergeSort.new
    assert_equal ["a","b"], msort.sort(["b","a"])
  end

  def test_sample_sort
    msort = MergeSort.new
    to_sort = [4,2,0,3,1]
    assert_equal [0,1,2,3,4], msort.sort(to_sort)
  end

  def test_sort_a_bunch_of_elements_even_number
    isort = InsertionSort.new
    sorted = (1..100).to_a
    shuffled = sorted.shuffle
    shuffled = sorted.shuffle while shuffled == sorted
    assert_equal sorted, isort.sort(shuffled)
  end

  def test_sort_a_bunch_of_elements_odd_number
    isort = InsertionSort.new
    sorted = (0..100).to_a
    shuffled = sorted.shuffle
    shuffled = sorted.shuffle while shuffled == sorted
    assert_equal sorted, isort.sort(shuffled)
  end

end
