class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    add_element(key, value)
  end

  def add_element(key, value)
    new_hash = HashItem.new(key, value)
    new_index = index(key, self.size)

    items_element = @items[new_index]

    if @items[new_index] == nil
      @items[new_index] = new_hash
      puts "array size"
      puts self.size
      puts "hash"
      puts new_hash.key
      puts new_hash.value
      return
    elsif @items[new_index].key == key
      if @items[new_index].value != value
        resize
        @items[new_index] = hash
      end
    else
      resize
      add_element(key, value)
    end
  end

  def [](key)
    items_index = index(key, self.size)
    @items[items_index].value
  end

  def resize
    temp_array = @items
    @items = Array.new(self.size * 2)
    temp_array.each do |x| 
      add_element(x.key, x.value) unless x == nil
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

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

end