def numbers(n, arr)
 arr << 1
 if (n == 0)
   return 0
 elsif (n == 1)
   return 1
 else
   return numbers(n-1, arr) + numbers(n-2, arr)
 end
end

arr = []
puts numbers(3, arr)
puts "#{arr.length} operations for n=3"

arr = []
puts numbers(4, arr)
puts "#{arr.length} operations for n=4"

arr = []
puts numbers(5, arr)
puts "#{arr.length} operations for n=5"

arr = []
puts numbers(6, arr)
puts "#{arr.length} operations for n=6"

arr = []
puts numbers(7, arr)
puts "#{arr.length} operations for n=7"

arr = []
puts numbers(8, arr)
puts "#{arr.length} operations for n=8"

arr = []
puts numbers(9, arr)
puts "#{arr.length} operations for n=9"

arr = []
puts numbers(10, arr)
puts "#{arr.length} operations for n=10"

arr = []
puts numbers(20, arr)
puts "#{arr.length} operations for n=20"

arr = []
puts numbers(30, arr)
puts "#{arr.length} operations for n=30"