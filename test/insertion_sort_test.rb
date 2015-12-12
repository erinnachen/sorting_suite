require 'minitest'
require 'insertion_sort'

class InsertionSortTest < Minitest::Test
  def test_sort_of_empty_array_is_the_empty_array
    isort = InsertionSort.new
    assert_equal [], isort.sort([])
  end

  def test_sort_of_single_element_array_returns_array_with_the_same_value
    isort = InsertionSort.new
    assert_equal ["a"], isort.sort(["a"])
  end

  def test_sorted_two_element_array_returns_an_array_with_elements_still_sorted
    isort = InsertionSort.new
    assert_equal ["a","b"], isort.sort(["a","b"])
  end

  def test_unsorted_two_element_array_returns_an_array_with_the_elements_flipped
    isort = InsertionSort.new
    assert_equal ["a","b"], isort.sort(["b","a"])
  end

  def test_sample_sort
    isort = InsertionSort.new
    to_sort = [4,2,0,3,1]
    assert_equal [0,1,2,3,4], isort.sort(to_sort)
  end

  def test_sort_elements_already_sorted
    isort = InsertionSort.new
    to_sort = (1..10).to_a
    assert_equal to_sort, isort.sort(to_sort)
  end

  def test_sort_elements_sorted_in_reverse
    isort = InsertionSort.new
    to_sort = (1..10).to_a.reverse
    assert_equal (1..10).to_a, isort.sort(to_sort)
  end


  def test_sort_a_bunch_of_elements
    isort = InsertionSort.new
    sorted = (1..100).to_a
    shuffled = sorted.shuffle
    shuffled = sorted.shuffle while shuffled == sorted
    assert_equal sorted, isort.sort(shuffled)
  end

end

class InplaceInsertSortTest < Minitest::Test
  def test_sort_of_empty_array_is_the_same_empty_array
    array = []
    ipisort = InsertionSort.new(array)
    assert_equal [], ipisort.inplace_sort
    assert_equal array.object_id, ipisort.inplace_sort.object_id
  end

  def test_sort_of_single_element_array_is_the_same_array
    array = ["a"]
    ipisort = InsertionSort.new(array)
    assert_equal ["a"], ipisort.inplace_sort
    assert_equal array.object_id, ipisort.inplace_sort.object_id
  end

  def test_find_insert_ind_finds_the_correct_index_no_swap_needed
    array = [1,2,3]
    ipisort = InsertionSort.new(array)
    assert_equal 2, ipisort.find_insert_ind(2)
  end

  def test_find_insert_ind_finds_the_correct_insert_index
    array = [1,2,4,7,9,3]
    ipisort = InsertionSort.new(array)
    assert_equal 2, ipisort.find_insert_ind(5)
  end

  def test_sort_of_sorted_two_element_array_returns_the_same_array
    array = ["a", "b"]
    ipisort = InsertionSort.new(array)
    assert_equal ["a","b"], ipisort.inplace_sort
    assert_equal array.object_id, ipisort.inplace_sort.object_id
  end

  def test_sort_of_unsorted_two_element_array_returns_the_same_array_with_elements_sorted
    array = ["b", "a"]
    ipisort = InsertionSort.new(array)
    assert_equal array.object_id, ipisort.inplace_sort.object_id
    assert_equal ["a","b"], ipisort.inplace_sort
  end

  def test_sample_sort
    array = [4,2,0,3,1]
    ipisort = InsertionSort.new(array)
    assert_equal array.object_id, ipisort.inplace_sort.object_id
    assert_equal [0,1,2,3,4], ipisort.inplace_sort
  end

  def test_sort_elements_already_sorted
    array = (1..10).to_a
    ipisort = InsertionSort.new(array)
    assert_equal array, ipisort.inplace_sort
    assert_equal array.object_id, ipisort.inplace_sort.object_id
  end

  def test_sort_elements_sorted_in_reverse
    array = (1..10).to_a.reverse
    ipisort = InsertionSort.new(array)
    assert_equal array, ipisort.inplace_sort
    assert_equal array.object_id, ipisort.inplace_sort.object_id
  end

  def test_sort_a_bunch_of_elements
    sorted = (1..100).to_a
    shuffled = sorted.shuffle
    shuffled = sorted.shuffle while shuffled == sorted
    ipisort = InsertionSort.new(shuffled)
    assert_equal shuffled.object_id, ipisort.inplace_sort.object_id
    assert_equal sorted, ipisort.inplace_sort
  end
end
