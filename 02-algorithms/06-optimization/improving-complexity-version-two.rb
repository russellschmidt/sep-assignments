# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
 combined_array = []
 arrays.each do |array|
   array.each do |value|
     combined_array << value
   end
 end

 sorted_array = [combined_array.delete_at(combined_array.length-1)]

 for val in combined_array
   i = 0
   while i < sorted_array.length
     if val <= sorted_array[i]
       sorted_array.insert(i, val)
       break
     elsif i == sorted_array.length - 1
       sorted_array.insert(i, val)
       break
     end
     i+=1
   end
 end

 # Return the sorted array
 sorted_array
end


def time_complexity_simplified_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    combined_array = combined_array + array
  end

  merge_sort(combined_array)
end

def merge_sort(collection)
 if collection.length <= 1
   collection
 else
   mid = (collection.length / 2).floor
   left = merge_sort(collection[0..mid - 1])
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