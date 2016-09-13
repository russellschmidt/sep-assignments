require 'benchmark'
require_relative 'fibonacci_recursive'

Benchmark.bmbm do |x|
	x.report("Recursive Fibonacci") { puts fibRecursive(20) }
	x.report("Iterative Fibonacci") { puts fibIterative(20) }
end

Benchmark.bmbm do |x|
	x.report("Recursive Fibonacci") { puts fibRecursive(12) }
	x.report("Iterative Fibonacci") { puts fibIterative(12) }
end
