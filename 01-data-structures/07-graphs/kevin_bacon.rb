require 'kb_node'

class KevinBacon

	attr_accessor :start_node
	attr_accessor :movie_array

	def initialize(start_node)
		self.start_node = start_node
		self.movie_array = []
	end

	# Find Mr. Bacon, stopping at first hit under 6 degrees
	def find_kevin_bacon(start_node)

		# loop through each movie in start_node
			# movie_array << current_movie
			# if movie_array.count > 6
				# return failure
			# else
				# loop through current_movie stars
					# if star == kevin_bacon
						# return movie_array
					# else 
						# call find_kevin_bacon (current_actor) on each actor
					# end
				# end
			#end
		# end

		start_node.film_actor_hash.each do |movie, actor|
			movie_array << movie
			if movie.count > 6
				return false
			else
				actor.each do |a|
					if a.name == 'Kevin Bacon'
						return movie_array
					elsif a.name != actor.name #avoid a loop
						find_kevin_bacon(actor)
					end
				end
			end
		end
	end

	# Find Kevin Bacon and save all successful searches to an array
	def find_save_kevin_bacon(start_node, winning_attempts)
		# loop through each movie in start_node
			# movie_array << current_movie
			# if movie_array.count > 6
				# return failure
			# else
				# loop through current_movie stars
					# if current_actor == kevin_bacon
						# winning_attempts << movie_array
					# else 
						# find_save_kevin_bacon(current_actor)
					# end
				# end
			#end
		# end
		start_node.film_actor_hash.each do |movie, actor|
			movie_array << movie
			if movie.count > 6
				false
			else
				actor.each do |a|
					if a.name == 'Kevin Bacon'
						winning_attempts << movie_array
					elsif a.name != actor.name #avoid a loop
						find_kevin_bacon(actor)
					end
				end
			end
		end
	end

	# master tracker of these attempts
	def optimize_kevin_bacon_search
		# winning_attempts = []
		# find_kevin_bacon_2(winning_attempts)
		# if winning_attempts.count > 0
			# winning_attempts.each do |attempt|
				# compare with a neighbor, shorter one wins
				# there will be lots of ties we skip over
		# else
			# returns nil
		# end
		winning_attempts = []
		find_save_kevin_bacon(start_node, winning_attempts)
		winning_attempts.compact!
		if winning_attempts.count == 0
			puts 'no bacon :('
		else
			winning_attempts.index do |i|
				if i != 0
					if winning_attempts[i - 1] < winning_attempts[i]
						winning_attempts.delete_at(i)
					else
						winning_attempts.delete_at(i - 1)
					end
				end
			end
		end
		winning_attempts
	end
end