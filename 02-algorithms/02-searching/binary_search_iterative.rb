def binary_search(collection, value)

	low = 0
	high = collection.length - 1

	while low <= high
		mid = (low + high) / 2
		if collection[mid] > value
			high = mid - 1
		elsif collection[mid] < value
			low = mid + 1
		else
			return mid
		end
	end

	return "Not here" 

end

letters = []
("A".."Z").each do |letter|
	letters << letter
end

numbers = []
(0..1000).each do |number|
	numbers << number
end

puts binary_search(letters, "B")
puts binary_search(letters, "Y")
puts binary_search(letters, "?")

puts binary_search(numbers, 1)
puts binary_search(numbers, 999)
puts binary_search(numbers, -5)