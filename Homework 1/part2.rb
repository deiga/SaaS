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
		game[0]
	elsif game[0][1].rps_win? game[1][1]
		game[0]
	elsif game[1][1].rps_win? game[0][1]
		game[1]
	end
end

#puts rps_game_winner([["Armando", "P"], ["Dave", "S"]])[0]
#puts rps_game_winner([ ["Dave", "P"], ["Armando", "S"] ])[0]
#puts rps_game_winner([ ["Allen", "P"], ["Richard", "P"] ])[0]


def rps_tournament_winner(tournament)
	rps_tournament(tournament).flatten
end

def rps_tournament(tournament)
	winners = Array.new
	flat_tournament = tournament.flatten.reverse
	1.upto(flat_tournament.length / 4) { 
		players = Array.new
		players << flat_tournament.pop(2).reverse
		players << flat_tournament.pop(2).reverse
		winners << rps_game_winner(players) 
	}
	winners = rps_tournament_winner(winners) unless winners.length == 1
	winners
end

#puts rps_tournament_winner( [[[["Armando", "P"], ["Dave", "S"]], [["Richard", "R"], ["Michael", "S"]], ], [[["Allen", "S"], ["Omer", "P"]], [[ "David E.", "R"], ["Richard X.", "P"]]]]).inspect