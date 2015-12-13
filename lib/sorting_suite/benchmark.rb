require_relative 'bubble_sort'
require_relative 'insertion_sort'
require_relative 'merge_sort'
require_relative 'selection'

module SortingSuite
  class Benchmark
    attr_reader :sorters, :fastest_time, :fastest_sorter, :slowest_time, :slowest_sorter

    def initialize
      @sorters = known_sorters
      @slowest_time = nil
      @fastest_time = nil
      @slowest_sorter = nil
      @fastest_sorter = nil
    end

    def known_sorters
      [SortingSuite::BubbleSort, SortingSuite::InsertionSort, SortingSuite::Selection,
      SortingSuite::MergeSort]
    end

    def get_runtime(sorter)
      start_time = Time.now()
      sorter.sort
      end_time = Time.now()
      end_time-start_time
    end

    def time(sorting_class, unsorted = (1..300).to_a.shuffle)
      sorter = sorting_class.new(unsorted)
      runtime = get_runtime(sorter)
      "#{sorter_string(sorter)} took %0.6f seconds" % (runtime)
    end

    def fastest(input)
      sorters.each do |sorting_class|
        unsorted = input.dup
        sorter = sorting_class.new(unsorted)
        runtime = get_runtime(sorter)
        set_fastest_sorter(runtime, sorter)
        puts "#{sorter_string(sorter)} took %0.6f seconds" % (runtime)
      end
      "#{sorter_string(fastest_sorter)} is the fastest"
    end

    def slowest(input)
      sorters.each do |sorting_class|
        unsorted = input.dup
        sorter = sorting_class.new(unsorted)
        runtime = get_runtime(sorter)
        set_slowest_sorter(runtime, sorter)
        puts "#{sorter_string(sorter)} took %0.6f seconds" % (runtime)
      end
      "#{sorter_string(slowest_sorter)} is the slowest"
    end

    def set_fastest_sorter(runtime, sorter)
      if fastest_time.nil? || runtime < fastest_time
        @fastest_sorter = sorter
        @fastest_time = runtime
      end
    end

    def set_slowest_sorter(runtime, sorter)
      if slowest_time.nil? || runtime > slowest_time
        @slowest_sorter = sorter
        @slowest_time = runtime
      end
    end

    def sorter_string(sorter)
      sorter.class.to_s[14..-1]
    end
  end
end

if __FILE__ == $0
  b = SortingSuite::Benchmark.new()
  sample = [3,3,4,5,1]
  unsorted = (1..5000).to_a.shuffle
  puts b.time(SortingSuite::BubbleSort, sample)
  puts b.time(SortingSuite::InsertionSort, sample)
  puts b.time(SortingSuite::MergeSort, sample)
  puts
  puts b.time(SortingSuite::BubbleSort)
  puts b.time(SortingSuite::InsertionSort)
  puts b.time(SortingSuite::MergeSort)
  puts
  puts b.fastest(unsorted)
  puts
  puts b.slowest(unsorted)
  puts
end
