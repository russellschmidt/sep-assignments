class HashClass

  def initialize(size)
    @items = Array.new(size)
    # @keys = []
  end

  def []=(key, value)
    add_element(key, value)
  end

  def add_element(key, value)
    new_hash = HashItem.new(key, value)
    item_index = index(key, self.size)

    item_value = @items[item_index]
    if item_value == nil
      @items[item_index] = new_hash
      # @keys << key
      # puts "key: #{key}, value: #{value}, index: #{item_index}, @items[index]: #{@items[item_index]}"
    elsif item_value == value 
      nil
    else
      resize
      add_element(key, value)
    end
  end

  def [](key)
    array_index = index(key, self.size)
    new_hash = @items[array_index]
    new_hash.value
  end

  def resize
    temp_array = @items.map{|x| x}
    @items = Array.new(self.size * 2)

    temp_array.each do |element|

      new_hash = element

      new_hash.key
      new_hash.value
      # temp_i = index(hash.get_key, temp.length)
      # temp_v = hash.get_value

      add_element(temp_element.key, temp_element.value)
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