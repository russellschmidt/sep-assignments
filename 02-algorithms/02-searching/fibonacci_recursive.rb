 def fibRecursive(n)
   if (n == 0)
     # #1
     return 0
   elsif (n == 1)
     # #2
     return 1
   else
     # #3
     return fibRecursive(n-1) + fibRecursive(n-2)
   end
 end

 def fibIterative(n)
  fib_0 = 0
  fib_1 = 1

  if n == 0
    return 0
  else
    
    (1..(n-1)).each do |x|
      x = fib_0
      fib_0 = fib_1
      fib_1 = x + fib_1
    end

  end

  fib_1
end