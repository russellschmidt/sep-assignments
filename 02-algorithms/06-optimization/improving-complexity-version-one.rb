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



def optimized_but_still_bad_ruby(*arrays)
  combined_array = []
  # remove one iterative process that requires going through each element
  arrays.each do |array|
    combined_array = combined_array + array
  end

  # no reason to randomly grab the last item in unsorted arrays, thus requiring a length check
  sorted_array = [combined_array.delete_at(0)]

  for val in combined_array
    i = 0
    inserted? = false
    while i < sorted_array.length
      # eliminate the equality check, break
      if val < sorted_array[i]
        sorted_array.insert(i, val)
        inserted? = true
      # eliminate the elsif conditional, break
      end
      i+=1
      sorted_array << val unless inserted?
    end
  end
  
  sorted_array
end