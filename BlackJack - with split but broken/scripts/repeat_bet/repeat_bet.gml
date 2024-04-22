// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function repeat_bet(){
	
	dbg("repeat bet amount", obj_game.last_bet_value)
	var _repeat_bet = obj_game.last_bet_value;
	var _coin_exists = false;
	
	if obj_game.double_and_deal
	{
		_repeat_bet += _repeat_bet
	}
	

	if instance_exists(obj_coin)
		_coin_exists = true;
			
	var _new_bet = instance_create_depth(obj_game.player_chips_x,obj_game.player_chips_y,0,obj_coin);
		
	if not _coin_exists
	{
		obj_game.bet_obj = _new_bet.id
		_new_bet.destroy_after_anim = false
		dbg("don't destroy coin after anim")
	}
	else			
	{
		_new_bet.destroy_after_anim = true
		dbg("will destroy coin after anim")
	}
		
	// move coin
	_new_bet.targetx = obj_game.bet_x[0]
	_new_bet.targety = obj_game.bet_y[0]				
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
	obj_game.alarm[1] = 1
	obj_game.player_value[0] = 0
	obj_game.player_value[1] = 0
	obj_game.player_value[2] = 0
	obj_game.dealer_value = 0
}