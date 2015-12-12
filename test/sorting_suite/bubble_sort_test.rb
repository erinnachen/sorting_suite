require 'minitest'
require 'sorting_suite/bubble_sort'

module SortingSuite
  class BubbleSortTest < Minitest::Test
    def test_returns_empty_array_when_input_empty
      bs = BubbleSort.new([])
      assert_equal [], bs.sort
    end

    def test_returns_same_array_when_input_is_a_single_element
      array = ["a"]
      bs = BubbleSort.new(array)
      assert_equal ["a"], bs.sort
    end

    def test_swaps_two_elements_correctly
      bs = BubbleSort.new
      assert_equal ["b", "a"],bs.swap("a","b")
    end

    def test_returns_two_elements_sorted_correctly_if_sorted
      array = "ab".chars
      bs = BubbleSort.new(array)
      assert_equal ["a", "b"], bs.sort
    end

    def test_returns_two_elements_sorted_correctly_if_unsorted
      array = "ba".chars
      bs = BubbleSort.new(array)
      assert_equal ["a", "b"], bs.sort
    end

    def test_sample_sort
      to_sort = [4,2,0,3,1]
      bs = BubbleSort.new(to_sort)
      assert_equal [0,1,2,3,4], bs.sort
    end

    def test_sort_elements_already_sorted
      to_sort = (1..10).to_a
      bs = BubbleSort.new(to_sort)
      assert_equal (1..10).to_a, bs.sort
    end

    def test_sort_elements_sorted_in_reverse
      to_sort = (1..10).to_a.reverse
      bs = BubbleSort.new(to_sort)
      assert_equal (1..10).to_a, bs.sort
    end


    def test_sort_a_bunch_of_elements
      sorted = (1..100).to_a
      shuffled = sorted.shuffle
      shuffled = sorted.shuffle while shuffled == sorted
      bs = BubbleSort.new(shuffled)
      assert_equal sorted, bs.sort
    end

  end
end
