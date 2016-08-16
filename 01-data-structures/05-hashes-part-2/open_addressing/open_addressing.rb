require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    add_element(key, value)
  end

  def add_element(key, value)
    new_node = Node.new(key, value)
    new_index = index(key, self.size)

    items_element = @items[new_index]

    if @items[new_index] == nil
      @items[new_index] = new_node

      puts "-- Entered item on nil --"
      puts "key #{@items[new_index].key}"
      puts "value #{@items[new_index].value}"
      puts "index #{new_index}"
      puts "index length #{self.size}"

    elsif @items[new_index].key == key
      if @items[new_index].value != value
        new_index = next_open_index(new_index)
        if new_index > -1
          new_node.next = new_index
          @items[new_index] = new_node

          puts "-- Entered item on collision--"
          puts "key #{@items[new_index].key}"
          puts "value #{@items[new_index].value}"
          puts "index #{new_index}"
          puts "index length #{self.size}"

        else
          resize
          add_element(key, value)
          puts "-- Resize -- -----------"

          
        end
      end
    else
      new_index = next_open_index(new_index)
      if new_index > -1
        new_node.next = new_index
        @items[new_index] = new_node
      else
        resize
        add_element(key, value)
      end
    end
  end

  def [](key)
    items_index = index(key, self.size)
    next_index = @items[items_index].next
    if next_index == nil 
      @items[items_index].value
    else
      @items[next_index].value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    ascii = 0
    key.each_byte do |ch| 
      ascii += ch
    end
    ascii % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while index < self.size - 1
      index += 1
      if @items[index] == nil
        return index
      end
    end

    return -1 
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

  # Resize the hash
  def resize
    temp_array = @items
    @items = Array.new(self.size * 2)
    temp_array.each do |x| 
      add_element(x.key, x.value) unless x == nil
    end
  end
end