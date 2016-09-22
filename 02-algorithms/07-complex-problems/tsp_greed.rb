require_relative 'location'

# Nearest Neighbor heuristic implementation
# accepts a Location object as a starting point
# outputs list of locations in order of visitation
# 
def greedy_neighbor(location)
	puts "start at: #{location.name}"
	puts " --- "
	until location.visited
		neighbors = location.neighbors
		nearest_neighbor = neighbors[0]   #what if we already visited the nearest neighbor - we return to it!

		for neighbor in neighbors
			if nearest_neighbor[:city].visited
				nearest_neighbor = neighbor
			end

			unless neighbor[:city].visited
				if neighbor[:distance] < nearest_neighbor[:distance]
					nearest_neighbor = neighbor
				end
			end
		end

		puts "next city is:"
		puts nearest_neighbor[:city].name


		location.visited = true
		location = nearest_neighbor[:city]
	end
end


cityA = Location.new("City A")
cityB = Location.new("City B")
cityC = Location.new("City C")
cityD = Location.new("City D")

cityA.neighbors = [{city: cityB, distance: 2}, {city: cityC, distance: 3}, {city: cityD, distance: 11}]
cityB.neighbors = [{city: cityA, distance: 2}, {city: cityC, distance: 4}, {city: cityD, distance: 10}]
cityC.neighbors = [{city: cityB, distance: 4}, {city: cityA, distance: 3}, {city: cityD, distance: 9}]
cityD.neighbors = [{city: cityB, distance: 10}, {city: cityC, distance: 9}, {city: cityA, distance: 11}]

greedy_neighbor(cityA)
