class Node
  @attr_accessor name
  @attr_accessor film_actor_hash

  #film_actor_hash is a hash of movie keys and array of actor nodes as value

  def initialize(name, film_actor_hash)
  	self.name = name
  	self.film_actor_hash = film_actor_hash
  end

end