require_relative 'node'
require_relative 'heap_tree'

# min-heapify - put the unsorted array data into a min-heap, return root to heap
def min_heapify(collection, root)
  heap = HeapTree.new(root)

  for item in collection
    node = Node.new(item)
    heap.insert(root, node)
  end
  heap
end

# find the smallest item in the collection to be the root of min-heap, return its index
def find_root_index(collection)
  min_index = 0

  for item in collection
    if item < collection[min_index]
      min_index = collection.index(item)
    end
  end
  min_index
end


# heapsort - pop off the root each time and put into an array
def heap_sort(collection)
  sorted_list = []

  root_index = find_root_index(collection)
  root = Node.new(collection.delete_at(root_index))
  heap = min_heapify(collection, root)

  heap.lowest_value(nil, sorted_list)
  
  sorted_list
end
