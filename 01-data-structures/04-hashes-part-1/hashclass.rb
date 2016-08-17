class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    add_element(key, value)
  end

  def add_element(key, value)
    new_hash = HashItem.new(key, value)
    item_index = index(key, self.size)

    existing_hash = @items[item_index]
    if existing_hash == nil
      return @items[item_index] = new_hash
    elsif existing_hash.value == value 
      return value
    else
      resize
      # add_element(key, value)
    end
  end

  def [](key)
    new_index = index(key, self.size)
    @items[new_index].value
  end

  def resize
    temp_array = @items.map{|x| x}
    @items = Array.new(self.size * 2)

    temp_array.each do |el|
      if el != nil
        item_index = index(el.key, self.size)
        @items[item_index] = HashItem.new(el.key, el.value)
      end
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