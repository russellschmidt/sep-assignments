def input_to_iterations(collection)
	# Big-O for linear search is O(n)
	for element in collection 
		puts "#{element}: #{element}"
	end
end

collection = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

input_to_iterations(collection)