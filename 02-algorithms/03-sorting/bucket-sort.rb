def bucket_sort(collection)
	length = collection.count
	megaBucket = []
	bucketABC = []
	bucketDEF = []
	bucketGHI = []
	bucketJKL = []
	bucketMNO = []
	bucketPQR = []
	bucketSTU = []
	bucketVWXYZ = []


	# assign to buckets
	for element in collection
		if element < "D" 
			bucketABC << element
		elsif element < "G"
			bucketDEF << element
		elsif element < "J"
			bucketGHI << element
		elsif element < "M"
			bucketJKL << element
		elsif element < "P"
			bucketMNO << element
		elsif element < "S"
			bucketPQR << element
		elsif element < "V"
			bucketSTU << element
		elsif element <= "Zzzzzz"
			bucketVWXYZ << element
		end
	end

	# sort within buckets
	megaBucket << bucketABC << bucketDEF << bucketGHI << bucketJKL << bucketMNO << bucketPQR << bucketSTU << bucketVWXYZ
	(0...megaBucket.length).each do |i|
		megaBucket[i] = selection_sort(megaBucket[i]) 
	end

	megaBucket.flatten
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


arr = %W(Q W E R T Y U I O P A S D F G H J K L Z X C V B N M)
puts " before "
puts arr
puts " after "
puts bucket_sort(arr)
puts " -- "