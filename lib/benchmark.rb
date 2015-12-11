require_relative 'bubble_sort'
require_relative 'insertion_sort'
require_relative 'merge_sort'

module SortingSuite
  class Benchmark
    attr_reader :sorters

    def initialize
      @sorters = known_sorters
    end

    def known_sorters
      [BubbleSort, InsertionSort, MergeSort]
    end

    def time(sorting_class, unsorted = (1..300).to_a.shuffle)
      sorter = sorting_class.new
      start_time = Time.now()
      sorter.sort(unsorted)
      end_time = Time.now()

      "#{sorting_class} took %0.6f seconds" % (end_time-start_time)
    end

    def fastest(unsorted)
      fastest_time = nil
      fastest_sorter = nil
      sorters.each do |sorter|
        s = sorter.new
        start_time = Time.now()
        s.sort(unsorted)
        end_time = Time.now()
        run_time = end_time - start_time
        if fastest_time.nil?
          fastest_sorter = sorter
          fastest_time = run_time
        elsif run_time < fastest_time
          fastest_sorter = sorter
          fastest_time = run_time
        end
      end
      "#{fastest_sorter} is the fastest"
    end

    def slowest(unsorted)
      slowest_time = nil
      slowest_sorter = nil
      sorters.each do |sorter|
        s = sorter.new
        start_time = Time.now()
        s.sort(unsorted)
        end_time = Time.now()
        run_time = end_time - start_time
        if slowest_time.nil?
          slowest_sorter = sorter
          slowest_time = run_time
        elsif run_time > slowest_time
          slowest_sorter = sorter
          slowest_time = run_time
        end
      end
      "#{slowest_sorter} is the slowest"
    end

  end
end

if __FILE__ == $0
  b = SortingSuite::Benchmark.new()
  sample = [3,3,4,5,1]
  unsorted = (1..5000).to_a.shuffle
  puts b.time(BubbleSort, sample)
  puts b.time(InsertionSort, sample)
  puts b.time(MergeSort, sample)

  puts b.time(BubbleSort)
  puts b.time(InsertionSort)
  puts b.time(MergeSort)

  puts b.fastest(unsorted)
  puts b.slowest(unsorted)
end
