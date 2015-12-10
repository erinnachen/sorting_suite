require 'minitest'
require 'insertion_sort'

class InsertionSortTest < Minitest::Test
  def test_sort_of_empty_array_is_the_empty_array
    my_is = InsertionSort.new
    assert_equal [], my_is.sort([])

  end

end
