class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)

  if is_player(m1[0]) && is_player(m1[1]) && is_player(m2[0]) && is_player(m2[1])
#puts rps_game_winner( [rps_game_winner(m1),rps_game_winner(m2)])
  		return rps_game_winner( [rps_game_winner(m1),rps_game_winner(m2)])
		#return  [rps_game_winner(m1),rps_game_winner(m2)]
	else
		return 	rps_result(rps_result(m1[0],m1[1]),rps_result(m2[0],m2[1]))
	end
end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	moves={"P"=>1,"S"=>2,"R"=>3}
	if !moves[game[0][1]] || !moves[game[1][1]]
		raise NoSuchStrategyError
	end

	if game[0][1]==game[1][1]
		return game[0]
	else
		if (moves[game[0][1]]-moves[game[1][1]])==1 || (moves[game[0][1]]-moves[game[1][1]])==-2
			return game[0]
		else
			return game[1]
		end
	end
	
end

def rps_tournament_winner(tournament)

	if is_player(tournament)
		return  tournament
	  elsif  is_game(tournament)
		rps_tournament_winner(rps_game_winner(tournament))
	  else
		rps_game_winner([rps_tournament_winner(tournament[0]),
		rps_tournament_winner(tournament[1])])
	  end
end

def is_player (player)
	return player.class.to_s=="Array" && player.length==2 && player[0].class.to_s=="String" && player[1].class.to_s=="String"
end
def is_game (game)
	return game.class.to_s=="Array" && game.length==2 && is_player(game[0]) && is_player(game[1]) 
end

t=[
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]
#puts is_player(t[0][0][0])
#puts rps_tournament_winner(t);
