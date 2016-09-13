def binary_search(collection, value)

	low = 0
	high = collection.length - 1

	mid = (low + high) / 2

	if collection[mid].nil? 
		return "Not here"
	elsif collection[mid] < value
		collection = collection.slice(mid + 1, high - mid + 1)
		binary_search(collection, value)
	elsif collection[mid] > value
		collection = collection.slice(low, mid - 1 - low)
		binary_search(collection, value)
	else
		return mid
	end

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