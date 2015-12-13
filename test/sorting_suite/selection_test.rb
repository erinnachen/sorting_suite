require 'minitest'
require 'sorting_suite/selection'

module SortingSuite
  class SelectionTest < Minitest::Test
    def test_sort_of_empty_array_is_the_empty_array
      ssort = Selection.new([])
      assert_equal [], ssort.sort
    end

    def test_sort_of_single_element_array_is_the_same_array
      to_sort = ["a"]
      ssort = Selection.new(to_sort)
      assert_equal ["a"], ssort.sort
    end

    def test_sorted_two_element_array_returns_the_same_array
      to_sort = ["a","b"]
      ssort = Selection.new(to_sort)
      assert_equal ["a","b"], ssort.sort
    end

    def test_unsorted_two_element_array_returns_the_elements_flipped
      to_sort = ["b","a"]
      ssort = Selection.new(to_sort)
      assert_equal ["a","b"], ssort.sort
    end

    def test_sample_sort
      to_sort = [4,2,0,3,1]
      ssort = Selection.new(to_sort)
      assert_equal [0,1,2,3,4], ssort.sort
    end

    def test_sort_elements_already_sorted
      to_sort = (1..10).to_a
      ssort = Selection.new(to_sort)
      assert_equal to_sort, ssort.sort
    end

    def test_sort_elements_sorted_in_reverse
      to_sort = (1..10).to_a.reverse
      ssort = Selection.new(to_sort)
      assert_equal (1..10).to_a, ssort.sort
    end

    def test_sort_a_bunch_of_elements
      sorted = (1..100).to_a
      shuffled = sorted.shuffle
      shuffled = sorted.shuffle while shuffled == sorted
      ssort = Selection.new(shuffled)
      assert_equal sorted, ssort.sort
    end
  end
end
