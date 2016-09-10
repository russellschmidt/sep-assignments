def quick_sort(collection)
	pivot_index = collection.length - 1
	pivot = collection[pivot_index]

	for i in 0..pivot_index
		if collection[i] > collection[pivot_index]
			collection.insert(pivot_index + 1, collection[i])
			collection[i] = nil
		end
	end
	collection.compact!

	# split the array
	

	collection
end


arr = ["E","C","A","B","F","G","D"]

puts quick_sort(arr)