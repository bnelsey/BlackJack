/// @description Insert description here
// You can write your code in this editor


switch(sprite_index)
{
	case btn_bet:
		//show_message("value: " + string(value))
		
		// do nothing if player was already dealt cards
		if array_length(obj_game.player_cards[0]) > 0
			exit
			
			
		if obj_game.balance_value < 5 and obj_game.bet_value[0] < 1 
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
		if obj_game.bet_value[0] < 1 
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
			obj_coin.targetx = obj_game.bet_x[0]
			obj_coin.targety = obj_game.bet_y[0]			
			obj_coin.alarm[0] = 1
			obj_coin.change_player_bet = value
			obj_game.bet_obj = obj_coin.id
		}
		else
		{
			new_bet = instance_create_depth(350,608,0,obj_coin)
			// move coin
			new_bet.targetx = obj_game.bet_x[0]
			new_bet.targety = obj_game.bet_y[0]			
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
	
		obj_game.balance_value += obj_game.bet_value[0]
		obj_game.bet_value[0] = 0
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
	case btn_split:
	case btn_split_again:
	
		with(obj_game)
		{
			if balance_value > bet_value[0] and ace_joker_split == false
			{
				player_splits += 1
				
				
				num_jokers = array_count(player_cards[player_hand_current], 0)
				num_aces = array_count(player_cards[player_hand_current], 1)
				
				if num_jokers + num_aces > 0
				{
					ace_joker_split = true
				}
				
				// remove card from first hand
				player_card_dealt -= 2
				remove_card_value = array_pop(player_cards[player_hand_current])
				move_card = array_pop(player_card_instances[player_hand_current])
				array_push(player_card_instances[player_splits], move_card.id)
				array_push(player_cards[player_splits],remove_card_value)
				calculate_player_card(player_splits)
				calculate_player_card(player_hand_current)
				obj_game.alarm[1] = 32
				
				// move card object
				targetx = player_card_x[player_splits] + card_xoffset
				targety = player_card_y[player_splits] + card_yoffset
				_startdelay = 1
				tween_object(move_card,targetx,targety, 30, _startdelay)
				move_card.depth += 1
				player_card_dealt += 1

				// place bet below split cards
				new_bet = instance_create_depth(350,608,0,obj_coin)
				// move coin
				new_bet.targetx = obj_game.bet_x[player_splits]
				new_bet.targety = obj_game.bet_y[player_splits]
				new_bet.alarm[0] = 1
				new_bet.change_player_split_hand = player_splits
				new_bet.destroy_after_anim = false
				new_bet.change_player_bet = bet_value[0]
				new_bet.change_player_balance = -bet_value[0]
				
				

				delete_object_with_sprite(obj_button, btn_strategy)
				delete_object_with_sprite(obj_button, btn_stand)
				delete_object_with_sprite(obj_button, btn_hit)
				delete_object_with_sprite(obj_button, btn_double_down)
				delete_object_with_sprite(obj_button, btn_surrender)
				delete_object_with_sprite(obj_button, btn_split)
				delete_object_with_sprite(obj_button, btn_split_again)
				obj_game.alarm[7] = 30	
			}
			else
			{
				show_message("not enough remaining balance for split")	
			}
		}
	break;
	
	case btn_hit:
		player_hit()
		
				
		delete_object_with_sprite(obj_button, btn_strategy)
		delete_object_with_sprite(obj_button, btn_stand)
		delete_object_with_sprite(obj_button, btn_hit)
		delete_object_with_sprite(obj_button, btn_double_down)
		delete_object_with_sprite(obj_button, btn_surrender)
		delete_object_with_sprite(obj_button, btn_split)
		delete_object_with_sprite(obj_button, btn_split_again)
		
		
	break;
	case btn_stand:
	
		player_stand()
		
		
		delete_object_with_sprite(obj_button, btn_strategy)
		delete_object_with_sprite(obj_button, btn_stand)
		delete_object_with_sprite(obj_button, btn_hit)
		delete_object_with_sprite(obj_button, btn_double_down)
		delete_object_with_sprite(obj_button, btn_surrender)
		delete_object_with_sprite(obj_button, btn_split)
		delete_object_with_sprite(obj_button, btn_split_again)
	break;
	
	case btn_double_down:	
		if obj_game.bet_value[0]*2 > obj_game.balance_value
		{
			msg("not enough balance left for double down")
			image_alpha = 0.5
			exit
		}
		
		obj_game.double_down = true
		var _new_bet = instance_create_depth(obj_game.player_chips_x,obj_game.player_chips_y,0,obj_coin);
		_new_bet.destroy_after_anim = true
		
		// move coin
		_new_bet.targetx = obj_game.bet_x[0]
		_new_bet.targety = obj_game.bet_y[0]			
		_new_bet.alarm[0] = 1
		_new_bet.change_player_bet = obj_game.bet_value[0]
	
	
		obj_game.alarm[8] = 60 // player_hit() but with adjustable delay	
		
		
		with(obj_game)
		{
			if player_hand_current == player_splits
				alarm[2] = 110 // make dealer hit
			else
				player_stand()
		}
		

		delete_object_with_sprite(obj_button, btn_strategy)
		delete_object_with_sprite(obj_button, btn_stand)
		delete_object_with_sprite(obj_button, btn_hit)
		delete_object_with_sprite(obj_button, btn_double_down)
		delete_object_with_sprite(obj_button, btn_surrender)
		delete_object_with_sprite(obj_button, btn_split)
		delete_object_with_sprite(obj_button, btn_split_again)
	break;
	
	case btn_surrender:
		dbg("player surrender!")		
		obj_game.last_bet_value = obj_game.bet_value[0]
				
		// open dealer card and calculate
		hidden_card = find_hidden_card()			
		if hidden_card != noone
		{
			hidden_card.alarm[1] = 1
		}
		calculate_dealer_card()
				
		with(obj_game)
		{
			var _new_chip = instance_create_depth(bet_x[player_hand_current],bet_y[player_hand_current],0,obj_coin);
			// move chip
			_new_chip.targetx = dealer_chips_x 
			_new_chip.targety = dealer_chips_y	
			_new_chip.alarm[0] = 1
			_new_chip.destroy_after_anim = true					
			bet_value[player_hand_current] = bet_value[player_hand_current]/2
			obj_game.alarm[1] = 1
		
		
			if instance_exists(obj_game.bet_obj)
			{
				_new_chip = obj_game.bet_obj
			}
			else
			{
				_new_chip = instance_create_depth(bet_x[player_hand_current],bet_y[player_hand_current],0,obj_coin);
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
			delete_object_with_sprite(obj_button, btn_split)
			delete_object_with_sprite(obj_button, btn_split_again)
		}
	break;
	case btn_new_card_shoe:
		new_deck()	
	break;
}