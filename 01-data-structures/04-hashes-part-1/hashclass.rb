class HashClass

  def initialize(size)
    @items = Array.new(size)
    @keys = []
  end

  def []=(key, value)
    items_index = index(key, self.size)
    items_value = @items[items_index]
    if @items[items_index] == value
      return nil
    end
    if @items[items_index] != nil && @items[items_index] != value
      resize
      # should this be a recursive call in case we have 2 or more consecutive collisions
    end
    @items[items_index] = value
    @keys << key
    puts "#{items_index}: #{@items[items_index]}"
  end

  def [](key)
    # lookup
    array_index = index(key, self.size)
    @items[array_index]    
  end

  def resize
    temp = @items.map{|v| v}
    @items = Array.new(self.size * 2)
    @keys.each do |k| 
      @items[index(k, self.size)] = temp[index(k, temp.count)]
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    ascii = 0
    key.each_byte do |char|
      ascii += char
    end
    ascii % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

end