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
		mid = (collection / 2).floor
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


