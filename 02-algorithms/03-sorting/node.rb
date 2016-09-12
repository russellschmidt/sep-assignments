class Node
  attr_accessor :value
  attr_accessor :left
  attr_accessor :right
  attr_accessor :parent

  def initialize(value)
  	self.value = value
  	self.left = nil
  	self.right = nil
    self.parent = nil
  end
end