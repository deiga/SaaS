class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ;  end

class String
	def rps_win?(input) 
		case self
		when 'R'
			case input
			when 'S'
				true
			else
				false
			end
		when 'P'
			case input
			when 'R'
				true
			else
				false
			end
		when 'S'
			case input
			when 'P'
				true
			else
				false
			end
		end
	end
end

# R > S, S > P, P > R
def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	raise NoSuchStrategyError unless ['R', 'P', 'S'].include? game[0][1] and ['R', 'P', 'S'].include? game[1][1]
	if game[0][1] == game[1][1]
		game[0].inspect
	elsif game[0][1].rps_win? game[1][1]
		game[0].inspect
	elsif game[1][1].rps_win? game[0][1]
		game[1].inspect
	end
end

puts rps_game_winner([["Armando", "P"], ["Dave", "S"]])
puts rps_game_winner([["Armando", "P"], ["Dave", "P"]])

def rps_tournament_winner(tournament)
	winners = Array.new
	1.upto tournament.flatten.length {
		winners << rps_game_winner(tournament.flatten.pop(2))
	}
	winners
end

puts rps_tournament_winner( [[[["Armando", "P"], ["Dave", "S"]], [["Richard", "R"], ["Michael", "S"]], ], [[["Allen", "S"], ["Omer", "P"]], [[ "David E.", "R"], ["Richard X.", "P"]]]])