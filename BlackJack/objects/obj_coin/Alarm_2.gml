/// @description change values after animation



dbg("change player balance", change_player_balance)
dbg("change player bet", change_player_bet)
if change_player_balance != 0
{
	dbg("old obj_game.balance_value", obj_game.balance_value)
	dbg("balance_value adjusted by", change_player_balance)
}

if change_player_bet != 0
{
	dbg("old obj_game.bet_value", change_player_hand.bet_value)
	dbg("bet_value adjusted by", change_player_bet)
}
obj_game.balance_value += change_player_balance
change_player_hand.bet_value += change_player_bet



if change_player_balance != 0
{
	dbg("new obj_game.balance_value", obj_game.balance_value)
}

if change_player_bet != 0
{
	dbg("new change_player_hand.bet_value", change_player_hand.bet_value)
}

change_player_balance = 0
change_player_bet = 0

obj_game.alarm[1] = 1 // update display strings
change_player_hand.alarm[1] = 1 // update display strings

if destroy_after_anim
{
	dbg("coin destroyed, total coins left", instance_number(obj_coin)-1)
	instance_destroy()
}