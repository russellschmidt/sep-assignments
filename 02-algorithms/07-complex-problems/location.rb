class Location
  attr_accessor :name
  attr_accessor :neighbors
  attr_accessor :visited

  def initialize(name)
    self.name = name
    self.neighbors = []
    self.visited = false
  end
end