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