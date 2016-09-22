class Location
  attr_accessor :name
  attr_accessor :neighbors
  attr_accessor :visited

  def initialize(name, neighbors)
    self.name = name
    self.neighbors = neighbors
    visited = false
  end

  # neighbors = [{name: "city", distance: 400}, {name: "city2", distance: 200}]
  

end