def input_to_iterations(collection)
	# Big-O for linear search is O(n)
	for element in collection 
		puts "#{element}: #{element}"
	end
end

collection = [1, 2, 3, 4, 5, 10, 25, 50, 100]

input_to_iterations(collection)