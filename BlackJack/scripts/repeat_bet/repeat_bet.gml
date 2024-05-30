// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function repeat_bet(){

	audio_play_sound(Rebet_and_Deal_v1_wav,1,false)
	dbg("repeat bet amount", obj_game.last_bet_value)
	var _repeat_bet = obj_game.last_bet_value;
	var _coin_exists = false;
	
	if obj_game.double_and_deal
	{
		_repeat_bet += _repeat_bet
	}
	

	if instance_exists(obj_game.player_hand_current.bet_obj)
		_coin_exists = true;
			
	var _new_bet = instance_create_depth(obj_game.player_chips_x,obj_game.player_chips_y,0,obj_coin);
	_new_bet.change_player_hand = obj_game.player_hand_current	
	_new_bet.chip_stack = calculate_chip_stack(_repeat_bet)
		
	if not _coin_exists
	{
		obj_game.player_hand_current.bet_obj = _new_bet.id
		_new_bet.destroy_after_anim = false
		dbg("don't destroy coin after anim")
	}
	else			
	{
		_new_bet.destroy_after_anim = true
		dbg("will destroy coin after anim")
	}
		
	// move coin
	_new_bet.targetx = obj_game.player_hand_current.bet_x
	_new_bet.targety = obj_game.player_hand_current.bet_y				
	_new_bet.alarm[0] = 1
	_new_bet.change_player_bet = _repeat_bet
		
		
	delete_object_with_sprite(obj_button, btn_repeat_bet)
	delete_object_with_sprite(obj_button, btn_repeat_bet_and_deal)
	delete_object_with_sprite(obj_button, btn_2x_bet_and_deal)
		
	if not (obj_game.repeat_and_deal or obj_game.double_and_deal)
	{
		new_button = instance_create_depth(694,912,0,obj_button)
		new_button.sprite_index = btn_deal
		new_button = instance_create_depth(876,917,0,obj_button)
		new_button.sprite_index = btn_clear_bet
	}
		
	with(obj_card)
	{
		instance_destroy()
	}
	obj_game.balance_value -= _repeat_bet	
	obj_game.balance_chips = calculate_chip_stack(obj_game.balance_value)
	obj_game.alarm[1] = 1
	obj_game.player_value = 0
	obj_game.dealer_value = 0
	
	with(obj_game.hand0)
	{
		player_value = 0		
	}
	with(obj_game.hand1)
	{
		player_value = 0		
	}
	with(obj_game.hand2)
	{
		player_value = 0		
	}
}