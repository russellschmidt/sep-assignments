require 'benchmark'
require_relative 'bucket-sort'
require_relative 'heap-sort'
require_relative 'quick-sort'

def insertion_sort(unsorted_array)
	sorted_array = [unsorted_array.delete_at(0)]

	for element in unsorted_array
		sorted_array_index = 0

		while sorted_array_index < sorted_array.length
			if element <= sorted_array[sorted_array_index]
				sorted_array.insert(sorted_array_index, element)
				break
			elsif sorted_array_index == sorted_array.length - 1
				sorted_array.insert(sorted_array_index + 1, element)
				break
			end

			sorted_array_index += 1
		end
	end

	sorted_array
end


def selection_sort(collection)
	length = collection.length

	for i in 0..(length - 2)
		minimum_index = i

		for j in (i + 1)...length
			if collection[j] < collection[minimum_index]
				minimum_index = j
			end
		end

		temp = collection[i]
		collection[i] = collection[minimum_index]
		collection[minimum_index] = temp
	end

	collection
end


def bubble_sort(collection)
	n = collection.length

	begin
		swapped = false

		(n - 1).times do |i|
			if collection[i] > collection[i + 1]
				temp = collection[i]
				collection[i] = collection[i + 1]
				collection[i + 1] = temp
				swapped = true
			end
		end
	end until not swapped

	collection
end


def merge_sort(collection)
	if collection.length <= 1
		collection
	else
		mid = (collection.length / 2).floor
		left = merge_sort(collection[0..mid-1])
		right = merge_sort(collection[mid..collection.length])
		merge(left, right)
	end
end

def merge(left, right)
	if left.empty?
		right
	elsif right.empty?
		left
	elsif left.first < right.first
		[left.first] + merge(left[1..left.length], right)
	else
		[right.first] + merge(left, right[1..right.length])
	end
end

##################################################################
arr = %W[Q W E R T Y U I O P A S D F G H J K L Z X C V B N M]

arr2, arr3 = [], []

1000.times {
	arr2 << "#{["A".."Z"].sample}#{["A".."Z"].sample}#{["A".."Z"].sample}#{["A".."Z"].sample}#{["A".."Z"].sample}"
}

50.times {
	arr3 << "#{["A".."Z"].sample}#{["A".."Z"].sample}#{["A".."Z"].sample}#{["A".."Z"].sample}#{["A".."Z"].sample}"
}

Benchmark.bmbm do |x|
	x.report("insertion sort") { insertion_sort(arr) }
	x.report("selection sort") { insertion_sort(arr) }
	x.report("bubble sort") { bubble_sort(arr) }
	x.report("merge sort") { merge_sort(arr) }
	x.report("quick sort") { quick_sort(arr) }
	x.report("heap sort") { heap_sort(arr) }
	x.report("bucket sort") { bucket_sort(arr) }
end

Benchmark.bmbm do |x|
	x.report("insertion sort") { insertion_sort(arr2) }
	x.report("selection sort") { insertion_sort(arr2) }
	x.report("bubble sort") { bubble_sort(arr2) }
	x.report("merge sort") { merge_sort(arr2) }
	x.report("quick sort") { quick_sort(arr2) }
	x.report("heap sort") { heap_sort(arr2) }
	x.report("bucket sort") { bucket_sort(arr2) }
end

Benchmark.bmbm do |x|
	x.report("insertion sort") { insertion_sort(arr3) }
	x.report("selection sort") { insertion_sort(arr3) }
	x.report("bubble sort") { bubble_sort(arr3) }
	x.report("merge sort") { merge_sort(arr3) }
	x.report("quick sort") { quick_sort(arr3) }
	x.report("heap sort") { heap_sort(arr3) }
	x.report("bucket sort") { bucket_sort(arr3) }
end

