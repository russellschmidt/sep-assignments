class HashClass

  def initialize(size)
    @items = Array.new(size)
    @keys = []
  end

  def []=(key, value)
    # create 
    items_index = index(key, self.size)
    items_value = @items[items_index]
    if items_value == nil
      @items[items_index] = value
      @keys << key
      puts "#{items_index}: #{@items[items_index]}"
    elsif
      @items[items_index] == value
    else
      resize
    end
  end


  def [](key)
    # lookup
    value_index = index(key, self.size)
    @items[value_index]    
  end

  def resize
    temp_size = self.size
    temp = @items.map{|v| v}
    @items = Array.new(temp_size * 2)
    @keys.each do |k| 
      @items[index(k, temp_size * 2)] = temp[index(k, temp_size)]
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