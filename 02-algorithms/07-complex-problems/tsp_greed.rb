require_relative 'location'

# Nearest Neighbor heuristic implementation
# accepts a Location object as a starting point
# outputs list of locations in order of visitation
# 
# def rusty_nearest_neighbor(location)
# 	until location.visited
# 		neighbors = location.neighbors
# 		next_city = neighbors[0]

# 		for neighbor in neighbors
# 			# if neighbor.distance > next_city.distance
# 			# 	next_city = neighbor
# 			# end
# 			puts neighbor
# 		end

# 		location.visited = true
# 		location = next_city
# 	end
# end


# def output_nearest_neighbors
# 	happytown = Location.new('Happy Town', 
# 		[{name: 'Doodles', distance: 100}, 
# 			{name: 'Murdersewer', distance: 200}, 
# 			{name: 'Shangri-la', distance: 10000}
# 		])
# 	doodles = Location.new('Doodles', 
# 		[{name: 'Happy Town', distance: 100}, 
# 			{name: 'Murdersewer', distance: 150}, 
# 			{name: 'Shangri-la', distance: 20000}])
# 	murdersewer = Location.new('Murdersewer', 
# 		[{name: 'Doodles', distance: 150}, 
# 			{name: 'Happy Town', distance: 200}, 
# 			{name: 'Shangri-la', distance: 10}])
# 	shangrila = Location.new('Shangri-la', 
# 		[{name: 'Doodles', distance: 20000}, 
# 			{name: 'Murdersewer', distance: 10}, 
# 			{name: 'Happy Town', distance: 10000}])

# 	puts rusty_nearest_neighbor(happytown)
# 	puts rusty_nearest_neighbor(doodles)
# 	puts rusty_nearest_neighbor(murdersewer)
# 	puts rusty_nearest_neighbor(shangrila)
# end


# 
# Ruby implementation of the Greedy Methodology from Asst 7
def nearest_neighbor(graph_of_cities, current_city)
	while not current_city.visited
		neighbor_cities = current_city.neighbors
		next_city = neighbor_cities[0]

		for current_neighbor in neighbor_cities
			if current_neighbor.distance < next_city.distance
				next_city = current_neighbor
			end
		end

		current_city.visited = true
		current_city = next_city
	end
end


# output_nearest_neighbors