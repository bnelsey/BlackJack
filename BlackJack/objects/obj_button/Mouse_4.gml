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
			
		clear_hand_values()

		// handle what to do when repeat buttons exist
		if find_object_with_sprite(obj_button,btn_repeat_bet)
		{
			with(obj_card)
			{
				instance_destroy()
			}
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
		
		if not instance_exists(obj_game.player_hand_current.bet_obj)
		{
			obj_game.player_hand_current.bet_obj = instance_create_depth(350,608,0,obj_coin)
			// move coin
			obj_coin.targetx = obj_game.player_hand_current.bet_x
			obj_coin.targety = obj_game.player_hand_current.bet_y				
			obj_coin.alarm[0] = 1
			obj_coin.change_player_hand = obj_game.player_hand_current
			obj_coin.change_player_bet = value
			obj_game.player_hand_current.bet_obj = obj_coin.id
		}
		else
		{
			new_bet = instance_create_depth(350,608,0,obj_coin)
			// move coin
			new_bet.targetx = obj_game.player_hand_current.bet_x
			new_bet.targety = obj_game.player_hand_current.bet_y				
			obj_game.player_hand_current.alarm[0] = 1
			new_bet.destroy_after_anim = true
			obj_coin.change_player_hand = obj_game.player_hand_current
			new_bet.change_player_bet = value
		}
		
		
	break	
	case btn_clear_bet:	
			
		with(obj_coin)
		{
			instance_destroy()	
		}
		
		obj_game.balance_value += obj_game.player_hand_current.bet_value
		obj_game.player_hand_current.bet_value = 0
		obj_game.alarm[1] = 1 // refresh strings
		
		clear_hand_values()
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
		
		clear_hand_values()
		repeat_bet()
	break;
	case btn_repeat_bet_and_deal:			
	
		if obj_game.last_bet_value > obj_game.balance_value
		{
			dbg("not enough balance left for repeat")
			image_alpha = 0.5
			exit
		}
	
		clear_hand_values()
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
		
		clear_hand_values()
		obj_game.double_and_deal = true
		repeat_bet()
		
		obj_game.alarm[6] = 32
	break;
	case btn_deal:
		clear_hand_values()
		obj_game.alarm[6] = 1
	break	
	

	case btn_split:
	case btn_split_again:
	
		if obj_game.player_splits > 1
			exit
	
		with(obj_game)
		{
			if balance_value > player_hand_current.bet_value and ace_joker_split == false
			{
				player_splits += 1
				
				num_jokers = array_count(player_hand_current.player_cards, 0)
				num_aces = array_count(player_hand_current.player_cards, 1)
				
				if num_jokers + num_aces > 0
				{
					ace_joker_split = true
				}
				
				// remove card from first hand
				player_hand_current.player_card_dealt -= 2
				remove_card_value = array_pop(player_hand_current.player_cards)
				move_card = array_pop(player_hand_current.player_card_instances)				
				calculate_hand_card()
				
				// temporary set split hand as current hand to calculate
				var _current_hand_temp = player_hand_current;			
				dbg("player_splits", player_splits)	
				array_push(player_hand_list[player_splits].player_card_instances, move_card.id)
				array_push(player_hand_list[player_splits].player_cards,remove_card_value)
				player_hand_current = player_hand_list[player_splits] // temporary set for calculating value
				calculate_hand_card()
				
				action_add(DEAL_CARD,30,0,[player_hand_current])
				action_add(SET_ALARM,1,1,[obj_game,9,1])
				action_add(SET_ALARM,1,1,[obj_game,1,1])
				player_hand_current = _current_hand_temp // return to original hand
				action_add(DEAL_CARD,30,0,[player_hand_current])
				action_add(SET_ALARM,1,1,[obj_game,9,1])
				action_add(SET_ALARM,1,1,[obj_game,1,1])
				action_add(SET_ALARM,1,1,[obj_game,7,1]) // show buttons
				
				// move card object
				targetx = player_hand_list[player_splits].player_card_x + card_xoffset
				targety = player_hand_list[player_splits].player_card_y + card_yoffset
				_startdelay = 1
				tween_object(move_card,targetx,targety, 30, _startdelay)
				move_card.depth += 1
				player_card_dealt += 1

				// place bet below split cards
				new_bet = instance_create_depth(350,608,0,obj_coin)
				// move coin
				new_bet.targetx = player_hand_list[player_splits].bet_x
				new_bet.targety = player_hand_list[player_splits].bet_y
				new_bet.alarm[0] = 1
				//new_bet.change_player_split_hand = player_hand_list[player_splits].
				new_bet.change_player_hand = player_hand_list[player_splits]
				new_bet.destroy_after_anim = false
				new_bet.change_player_bet = _current_hand_temp.bet_value
				new_bet.change_player_balance = -_current_hand_temp.bet_value
				player_hand_list[player_splits].bet_obj = new_bet
				

				delete_object_with_sprite(obj_button, btn_strategy)
				delete_object_with_sprite(obj_button, btn_stand)
				delete_object_with_sprite(obj_button, btn_hit)
				delete_object_with_sprite(obj_button, btn_double_down)
				delete_object_with_sprite(obj_button, btn_surrender)
				delete_object_with_sprite(obj_button, btn_split)
				delete_object_with_sprite(obj_button, btn_split_again)
				
				// every time a split happens, right most hand will be played!
				msg("obj_game.player_hand_current", obj_game.player_hand_current, "obj_game.player_hand_list[1]", obj_game.player_hand_list[1])
				obj_game.player_hand_current = obj_game.player_hand_list[1]
				player_hand_current_id = 1
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
		//obj_game.alarm[2] = 1	
		delete_object_with_sprite(obj_button, btn_strategy)
		delete_object_with_sprite(obj_button, btn_stand)
		delete_object_with_sprite(obj_button, btn_hit)
		delete_object_with_sprite(obj_button, btn_double_down)
		delete_object_with_sprite(obj_button, btn_surrender)
		delete_object_with_sprite(obj_button, btn_split)
		delete_object_with_sprite(obj_button, btn_split_again)
	break;
	
	case btn_double_down:	
		if obj_game.player_hand_current.bet_value > obj_game.balance_value
		{
			msg("not enough balance left for double down: " + string(obj_game.player_hand_current.bet_value) + ">" + string(obj_game.balance_value))
			image_alpha = 0.5
			exit
		}
		
		obj_game.double_down = true
		var _new_bet = instance_create_depth(obj_game.player_chips_x,obj_game.player_chips_y,0,obj_coin);
		_new_bet.change_player_hand = obj_game.player_hand_current
		_new_bet.destroy_after_anim = true
		
		// move coin
		_new_bet.targetx = obj_game.player_hand_current.bet_x
		_new_bet.targety = obj_game.player_hand_current.bet_y	
		_new_bet.alarm[0] = 1
		_new_bet.change_player_bet = obj_game.player_hand_current.bet_value
	
	
		obj_game.alarm[8] = 60 // player_hit() but with adjustable delay	
		
		
		with(obj_game)
		{
			if player_hand_current_id == player_splits
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
		dbg("player surrender! hand bet value:", obj_game.player_hand_current.bet_value)
		obj_game.last_bet_value = obj_game.player_hand_current.bet_value
				
		// open dealer card and calculate
		hidden_card = find_hidden_card()			
		if hidden_card != noone
		{
			hidden_card.alarm[1] = 1
		}
		calculate_dealer_card()
				
		with(obj_game)
		{
			var _new_chip = instance_create_depth(player_hand_current.bet_x,player_hand_current.bet_y,0,obj_coin);
			_new_chip.change_player_hand = player_hand_current
			// move chip
			_new_chip.targetx = dealer_chips_x 
			_new_chip.targety = dealer_chips_y	
			_new_chip.alarm[0] = 1
			_new_chip.destroy_after_anim = true					
			player_hand_current.bet_value = player_hand_current.bet_value/2
			obj_game.alarm[1] = 1
			obj_game.player_hand_current.alarm[1] = 1
		
		
			if instance_exists(player_hand_current.bet_obj)
			{
				_new_chip = player_hand_current.bet_obj
				_new_chip.change_player_hand = player_hand_current
			}
			else
			{
				_new_chip = instance_create_depth(player_hand_current.bet_x,player_hand_current.bet_y,0,obj_coin);
				_new_chip.change_player_hand = player_hand_current
			}
			// move chip
			_new_chip.targetx = player_chips_x
			_new_chip.targety = player_chips_y				
			_new_chip.alarm[0] = 60
			_new_chip.destroy_after_anim = true
			_new_chip.change_player_balance = player_hand_current.bet_value
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
		with(obj_game)
		{			
			// move bets to hand if any			
			for(i=0;i<=2;i+=1)
			{
				modify_hand = player_hand_list[i]
				_bet_value = modify_hand.bet_value
				modify_hand.playing = false
				if _bet_value > 0
				{
					action_add(CHANGE_BET,0,0,[modify_hand,-_bet_value])
					action_move(0,30,modify_hand.bet_obj,player_chips_x, player_chips_y, 30)
					action_add(DESTROY_OBJECT,0,0,modify_hand.bet_obj)
					action_add(CHANGE_BALANCE,0,0,_bet_value)
				}
			}
			
			dealer_value = 0
			player_hand_current_id = 0 // 0 middle, 1 right, 2 left
			player_splits = 0
			ace_joker_split = false
			
			round_new()
		}
		
		clear_hand_values()
		new_deck()	
		with(obj_card)
		{
			instance_destroy()	
		}
		
		delete_object_with_sprite(obj_button, btn_strategy)
		delete_object_with_sprite(obj_button, btn_stand)
		delete_object_with_sprite(obj_button, btn_hit)
		delete_object_with_sprite(obj_button, btn_double_down)
		delete_object_with_sprite(obj_button, btn_surrender)
		delete_object_with_sprite(obj_button, btn_split)
		delete_object_with_sprite(obj_button, btn_split_again)
		delete_object_with_sprite(obj_button, btn_repeat_bet)
		delete_object_with_sprite(obj_button, btn_repeat_bet_and_deal)
		delete_object_with_sprite(obj_button, btn_2x_bet_and_deal)
		delete_object_with_sprite(obj_button, btn_clear_bet)
		delete_object_with_sprite(obj_button, btn_deal)
	break;
}