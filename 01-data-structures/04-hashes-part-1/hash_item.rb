class HashItem
  attr_accessor :key
  attr_accessor :value

  def initialize(key, value)
    self.key, self.value = key, value
  end
end