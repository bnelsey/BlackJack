/// @description Insert description here
// You can write your code in this editor


switch(sprite_index)
{
	case btn_bet:
		//show_message("value: " + string(value))
		
		// do nothing if player was already dealt cards
		if array_length(obj_game.player_cards) > 0
			exit
			
			
		if obj_game.balance_value < 5 and obj_game.bet_value < 1 
		{
			msg("no more player funds, game restarting"	)
			game_restart()
			exit
		}
			
		if obj_game.balance_value < value
			exit
			
		// handle what to do when repeat buttons exist
		if find_object_with_sprite(obj_button,btn_repeat_bet)
		{
			with(obj_card)
			{
				instance_destroy()
			}
			obj_game.player_value = 0
			obj_game.dealer_value = 0
			
			delete_object_with_sprite(obj_button, btn_repeat_bet)
			delete_object_with_sprite(obj_button, btn_repeat_bet_and_deal)
			delete_object_with_sprite(obj_button, btn_2x_bet_and_deal)
		}
						
			
		// if no bet yet, make buttons
		if obj_game.bet_value < 1 
		{
			new_button = instance_create_depth(694,912,0,obj_button)
			new_button.sprite_index = btn_deal
			new_button = instance_create_depth(876,917,0,obj_button)
			new_button.sprite_index = btn_clear_bet
			
		}
		
		obj_game.balance_value -= value
		obj_game.alarm[1] = 1 // refresh strings
		
		if not instance_exists(obj_coin)
		{
			instance_create_depth(350,608,0,obj_coin)
			// move coin
			obj_coin.targetx = obj_game.bet_x
			obj_coin.targety = obj_game.bet_y				
			obj_coin.alarm[0] = 1
			obj_coin.change_player_bet = value
			obj_game.bet_obj = obj_coin.id
		}
		else
		{
			new_bet = instance_create_depth(350,608,0,obj_coin)
			// move coin
			new_bet.targetx = obj_game.bet_x
			new_bet.targety = obj_game.bet_y				
			new_bet.alarm[0] = 1
			new_bet.destroy_after_anim = true
			new_bet.change_player_bet = value
		}
		
		
	break	
	case btn_clear_bet:	
			
		with(obj_coin)
		{
			instance_destroy()	
		}
	
		obj_game.balance_value += obj_game.bet_value
		obj_game.bet_value = 0
		obj_game.alarm[1] = 1 // refresh strings
		
		delete_object_with_sprite(obj_button, btn_deal)
		delete_object_with_sprite(obj_button, btn_clear_bet)
	break	
	case btn_repeat_bet:
		if obj_game.last_bet_value > obj_game.balance_value
		{
			dbg("not enough balance left for repeat")
			image_alpha = 0.5
			exit
		}
		
		repeat_bet()
	break;
	case btn_repeat_bet_and_deal:			
	
		if obj_game.last_bet_value > obj_game.balance_value
		{
			dbg("not enough balance left for repeat")
			image_alpha = 0.5
			exit
		}
	
		obj_game.repeat_and_deal = true
		repeat_bet()
		
		obj_game.alarm[6] = 32
	break;
	case btn_2x_bet_and_deal:			
		if (obj_game.last_bet_value*2) > obj_game.balance_value
		{
			dbg("not enough balance left for repeat double")
			image_alpha = 0.5
			exit
		}
		
		obj_game.double_and_deal = true
		repeat_bet()
		
		obj_game.alarm[6] = 32
	break;
	case btn_deal:
		obj_game.alarm[6] = 1
	break	
	case btn_hit:
		with(obj_game)
		{
			if player_value < 21
			{
				deal_player_card(0)		
				calculate_player_card()
			}			
			
			if player_value == 21
			{
				dbg("player blackjack!")
				obj_game.alarm[2] = 1	
			}
			else if player_value > 21
			{
				dbg("player bust!")
				
				// open dealer card and calculate
				hidden_card = find_hidden_card()			
				if hidden_card != noone
				{
					hidden_card.alarm[1] = 1
				}
				calculate_dealer_card()
				
				obj_game.alarm[3] = 30
			}
			else
			{
				// create standard buttons
				obj_game.alarm[7] = 30	
			}
		}
		
				
		delete_object_with_sprite(obj_button, btn_strategy)
		delete_object_with_sprite(obj_button, btn_stand)
		delete_object_with_sprite(obj_button, btn_hit)
		delete_object_with_sprite(obj_button, btn_double_down)
		delete_object_with_sprite(obj_button, btn_surrender)
		
	break;
	case btn_stand:
		obj_game.alarm[2] = 1	
		delete_object_with_sprite(obj_button, btn_strategy)
		delete_object_with_sprite(obj_button, btn_stand)
		delete_object_with_sprite(obj_button, btn_hit)
		delete_object_with_sprite(obj_button, btn_double_down)
		delete_object_with_sprite(obj_button, btn_surrender)
	break;
	
	case btn_surrender:
		dbg("player surrender!")		
		obj_game.last_bet_value = obj_game.bet_value
				
		// open dealer card and calculate
		hidden_card = find_hidden_card()			
		if hidden_card != noone
		{
			hidden_card.alarm[1] = 1
		}
		calculate_dealer_card()
				
		with(obj_game)
		{
			var _new_chip = instance_create_depth(bet_x,bet_y,0,obj_coin);
			// move chip
			_new_chip.targetx = dealer_chips_x 
			_new_chip.targety = dealer_chips_y	
			_new_chip.alarm[0] = 1
			_new_chip.destroy_after_anim = true					
			bet_value = bet_value/2
			obj_game.alarm[1] = 1
		
		
			if instance_exists(obj_game.bet_obj)
			{
				_new_chip = obj_game.bet_obj
			}
			else
			{
				_new_chip = instance_create_depth(bet_x,bet_y,0,obj_coin);
			}
			// move chip
			_new_chip.targetx = player_chips_x
			_new_chip.targety = player_chips_y				
			_new_chip.alarm[0] = 60
			_new_chip.destroy_after_anim = true
			_new_chip.change_player_balance = bet_value
			//_new_chip.change_player_bet = -bet_value*2
		
			alarm[4] = 60
			

			delete_object_with_sprite(obj_button, btn_strategy)
			delete_object_with_sprite(obj_button, btn_stand)
			delete_object_with_sprite(obj_button, btn_hit)
			delete_object_with_sprite(obj_button, btn_double_down)
			delete_object_with_sprite(obj_button, btn_surrender)
		}
	break;
}