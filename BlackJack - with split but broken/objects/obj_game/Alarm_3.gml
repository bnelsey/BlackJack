/// @description round end

obj_game.last_bet_value = obj_game.bet_value[0]

if double_down
{
	dbg("double down so last bet value is set to half")
	obj_game.last_bet_value = obj_game.last_bet_value/2
}
round_end()
round_new()