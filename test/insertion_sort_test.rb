require 'minitest'
require 'insertion_sort'

class InsertionSortTest < Minitest::Test
  def test_sort_of_empty_array_is_the_empty_array
    isort = InsertionSort.new
    assert_equal [], isort.sort([])
  end

  def test_sort_of_single_element_array_is_the_same_array
    isort = InsertionSort.new
    assert_equal ["a"], isort.sort(["a"])
  end

  def test_sorted_two_element_array_returns_the_same_array
    isort = InsertionSort.new
    assert_equal ["a","b"], isort.sort(["a","b"])
  end

  def test_unsorted_two_element_array_returns_the_elements_flipped
    isort = InsertionSort.new
    assert_equal ["a","b"], isort.sort(["b","a"])
  end

  def test_sample_sort
    isort = InsertionSort.new
    to_sort = [4,2,0,3,1]
    assert_equal [0,1,2,3,4], isort.sort(to_sort)
  end

  def test_sort_a_bunch_of_elements
    isort = InsertionSort.new
    to_sort = (1..100).to_a
    unsorted = to_sort.shuffle
    unsorted = to_sort.shuffle while unsorted == to_sort
    assert_equal to_sort, isort.sort(unsorted)
  end

end
