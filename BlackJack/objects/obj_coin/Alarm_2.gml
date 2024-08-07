/// @description change values after animation


dbg("--------------------")
dbg("obj_coin my id:", id)
dbg("change values for change_player_hand", change_player_hand)

audio_play_sound(Add_Chips_to_Betting_Circle_v1_wav, 1, false)

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
	obj_game.balance_chips = calculate_chip_stack(obj_game.balance_value)
}


if change_player_bet != 0
{
	dbg("new change_player_hand.bet_value", change_player_hand.bet_value)
	var _bet_obj = change_player_hand.bet_obj;	
	_bet_obj.chip_stack = calculate_chip_stack( change_player_hand.bet_value)
}

change_player_balance = 0
change_player_bet = 0

obj_game.alarm[1] = 1 // update display strings
obj_game.player_hand_current.alarm[1] = 1 // update display strings
change_player_hand.alarm[1] = 1 // update display strings

if destroy_after_anim
{
	dbg("coin destroyed, total coins left", instance_number(obj_coin)-1)
	instance_destroy()
}
dbg("----------------------------------------------------")