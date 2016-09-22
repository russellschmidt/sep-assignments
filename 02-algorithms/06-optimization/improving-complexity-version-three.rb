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


#
# ANSWER
#


def space_time_trade_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    combined_array << array
  end
  combined_array.flatten!

  combined_array_length = combined_array.length
  sorted_array_length = 1

  (0..combined_array_length-1).times do |i|
    current_unsorted_element = combined_array.delete(i)
    inserted? = false
    (0..sorted_array_length-1).times do |j|
      if current_unsorted_element < combined_array[j]
        combined_array.insert(j, current_unsorted_element)
        inserted? = true
      end
    end
    combined_array.insert(sorted_array_length, current_unsorted_element) unless inserted?
    combined_array_length + 1
  end

  combined_array
end