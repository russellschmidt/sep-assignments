def quick_sort(collection)
	pivot_index = collection.length - 1
	pivot = collection[pivot_index]

	if collection.length <= 1
		collection
	else
		for i in 0..pivot_index
			if collection[i] > collection[pivot_index]
				collection.insert(pivot_index + 1, collection[i])
				collection[i] = nil
			end
		end
		collection.compact!

		pivot_index = collection.index(pivot)
		left = quick_sort(collection[0...pivot_index])
		right = quick_sort(collection[(pivot_index + 1)...collection.length])
	end
	collection = [left] + [pivot] + [right]
	collection.compact
end


arr = ["E","C","A","B","F","G","D"]
puts " before "
puts arr
puts " after "
puts quick_sort(arr)
puts " -- "