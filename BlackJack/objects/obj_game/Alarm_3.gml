/// @description round end

obj_game.last_bet_value = obj_game.player_hand_current.bet_value

if double_down
{
	dbg("double down so last bet value is set to half")
	obj_game.last_bet_value = obj_game.last_bet_value/2
}

if player_splits == 0
{
	round_end()
}
else if player_splits == 1
{
	player_hand_current = player_hand_list[1]
	round_end()
	player_hand_current = player_hand_list[0]
	round_end()
}
else if player_splits == 2
{
	player_hand_current = player_hand_list[1]
	round_end()
	player_hand_current = player_hand_list[0]
	round_end()
	player_hand_current = player_hand_list[2]
	round_end()
}


round_new()