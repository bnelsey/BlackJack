/// @description Insert description here
// You can write your code in this editor
if not visible
	exit


switch(sprite_index)
{
	case btn_insurance:
				
		with(obj_game)
		{			
			var _insurance_value = player_hand_current.bet_value;
			var _insurance_J21 = true;
			
			// initial checks
			if dealer_value == 9 or dealer_value == 12 // check J21
			{
				if balance_value < player_hand_current.bet_value
				{
					other.image_alpha = 0.5
					dbg("not enough balance left for joker21 insurance")
					exit
				}
			}
			else if dealer_value == 10 or dealer_value == 11 // check regular blackjack
			{
				if balance_value < floor(player_hand_current.bet_value*0.5)
				{
					other.image_alpha = 0.5
					dbg("not enough balance left for blackjack insurance")
					exit
				}				
				_insurance_value = floor(player_hand_current.bet_value*0.5) // insurance is only half of bet for regular blakcjack
				_insurance_J21 = false
			}
			
			hidden_card = find_hidden_card()			
			if hidden_card == noone
				exit
			
			var _hidden_card_startx = hidden_card.x;
			var _hidden_card_starty = hidden_card.y;
			
			insurance_taken = true
						
			var _new_bet = instance_create_depth(obj_game.player_chips_x,obj_game.player_chips_y,0,obj_coin);
			_new_bet.chip_stack = calculate_chip_stack(_insurance_value)
			
			
			// check hidden card value
			var _hidden_dealer_value = dealer_value;
			calculate_dealer_card()
			var _actual_dealer_value = dealer_value;
			dealer_value = _hidden_dealer_value; // do not change currently displayed dealer value
			
			//tween_object( _data_array[0], _data_array[1],  _data_array[2], _data_array[3], 0)	
			action_add(MOVE_OBJECT,1,30,[_new_bet,832,394,30,0])
			action_add(CHANGE_INSURANCE,1,1,[_insurance_value])
			action_add(SET_ALARM,1,30,[obj_game,1,1]) // refresh strings
			//action_add(MOVE_OBJECT,1,60,[peeker_base,996,108,30,0])
			//action_add(MOVE_OBJECT,1,30,[peeker_base,peeker_base_startx,peeker_base_starty, 30,0])			
			action_add(MOVE_OBJECT,1,60,[hidden_card,1331+56,21+79,30,0])
			action_add(MOVE_OBJECT,1,30,[hidden_card,_hidden_card_startx,_hidden_card_starty, 30,0])
			
			if _actual_dealer_value < 21
			{
				action_add(CHANGE_INSURANCE,1,1,[-_insurance_value])
				action_add(MOVE_OBJECT,1,30,[_new_bet,dealer_chips_x,dealer_chips_y,30,0])
				action_add(DESTROY_OBJECT,1,30,[_new_bet])	
				action_add(SET_ALARM,1,1,[obj_game,7,1]) // recreate buttons			
			}
			else
			{
				hidden_card = find_hidden_card()			
				if hidden_card != noone
				{
					action_add(SET_ALARM,1,30,[hidden_card,1,1])
					
					var _winnings = instance_create_depth(dealer_chips_x,dealer_chips_y,0,obj_coin);
					_winnings.chip_stack = calculate_chip_stack(_insurance_value*2)
					action_add(MOVE_OBJECT,1,30,[_winnings,832,394,30,0])
					action_add(DESTROY_OBJECT,1,1,[_winnings])
					action_add(CHIP_STACK,1,1,[_new_bet, _insurance_value*2 + _insurance_value])		
					action_add(CHANGE_INSURANCE,1,30,[_insurance_value*2])	
					action_add(MOVE_OBJECT,1,30,[_new_bet,player_chips_x,player_chips_y,30,0])
					action_add(CHANGE_INSURANCE,1,1,[-(_insurance_value*3)])
					action_add(CHANGE_BALANCE,1,30,[_insurance_value*3])
					action_add(SET_ALARM,1,1,[obj_game,10,1])
					action_add(DESTROY_OBJECT,1,1,[_new_bet])
				}
				
			}
			
		}
	
		clear_buttons()
	break;
	case btn_audio:
		if global.volume
		{
			global.volume = 0			
		}
		else
		{
			global.volume = 1	
		}
		image_index = global.volume
		audio_master_gain(global.volume)	
		

		ini_open("savegame.ini");
		ini_write_real("Settings", "Volume", global.volume);
		ini_close();
	break;
	case btn_chips_lower:
		if obj_game.bet_button_lowest.image_index > 6
		{
			with(obj_button)
			{
				if sprite_index == btn_bet
				{
					image_index -= 6
					
					// fix a bug when a button image_index goes below 0
					if image_index < 0
						image_index += sprite_get_number(btn_bet) 
						
					value = obj_game.chip_values[image_index]
					
					if image_index > 0 or image_index < sprite_get_number(btn_bet) 
						visible = true						
				}				
			}
		}
	break;
	case btn_chips_higher:
		if obj_game.bet_button_lowest.image_index + 6 < sprite_get_number(btn_bet) 
		{
			with(obj_button)
			{
				if sprite_index == btn_bet
				{
					image_index += 6
					
					if image_index == 0 or image_index >= sprite_get_number(btn_bet) 
						visible = false
					else
						value = obj_game.chip_values[image_index]
				}				
			}
		}
	break;
	case btn_bet:
		//show_message("value: " + string(value))
		
		// do nothing if player was already dealt cards
		if array_length(obj_game.player_hand_current.player_cards) > 0
			exit
			
		
		if obj_game.balance_value < 5 and obj_game.player_hand_current.bet_value < 1 and not instance_exists(obj_coin)
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
		obj_game.balance_chips = calculate_chip_stack(obj_game.balance_value)
		
		obj_game.alarm[1] = 1 // refresh strings
		if not instance_exists(obj_game.player_hand_current.bet_obj)
		{
			obj_game.player_hand_current.bet_obj = instance_create_depth(350,608,0,obj_coin)
			obj_game.player_hand_current.bet_obj = obj_coin.id
			// move coin
			obj_coin.targetx = obj_game.player_hand_current.bet_x
			obj_coin.targety = obj_game.player_hand_current.bet_y				
			obj_coin.alarm[0] = 1
			obj_coin.change_player_hand = obj_game.player_hand_current.id
			obj_coin.change_player_bet = value
			
			
			obj_coin.chip_stack = calculate_chip_stack(value)
			
			dbg("1 new coin made", obj_coin.id)
			
		}
		else
		{			
			new_bet = instance_create_depth(350,608,0,obj_coin)
			// move coin
			new_bet.targetx = obj_game.player_hand_current.bet_x
			new_bet.targety = obj_game.player_hand_current.bet_y
			new_bet.alarm[0] = 1
			new_bet.change_player_hand = obj_game.player_hand_current.id
			new_bet.change_player_bet = value
			new_bet.destroy_after_anim = true
			
			new_bet.chip_stack = calculate_chip_stack(value)
			dbg("1 new coin made", new_bet.id)
		}
		
		
		
		
	break	
	case btn_clear_bet:	
			
		with(obj_coin)
		{	
			obj_game.balance_chips = calculate_chip_stack(obj_game.balance_value)
			obj_game.balance_value += change_player_bet
			instance_destroy()	
		}
		
		obj_game.balance_value += obj_game.player_hand_current.bet_value		
		obj_game.balance_chips = calculate_chip_stack(obj_game.balance_value)
		obj_game.player_hand_current.bet_value = 0
		obj_game.alarm[1] = 1 // refresh strings
		
		clear_hand_values()
		clear_buttons()
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
			
		audio_play_sound(Split_v1_wav,1,false)
	
		with(obj_game)
		{
			if balance_value >= player_hand_current.bet_value and ace_joker_split == false
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
				new_bet.chip_stack = calculate_chip_stack(_current_hand_temp.bet_value)
				
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
				

				clear_buttons()
				
				// every time a split happens, right most hand will be played!
				if player_splits == 1
				{
					obj_game.player_hand_current = obj_game.player_hand_list[1]
					player_hand_current_id = 1
				}
				else // second split
				{
					if obj_game.player_hand_current.my_hand_id == 0
					{
						obj_game.player_hand_current = obj_game.player_hand_list[0]
						player_hand_current_id = 0
					}
					else
					{
						obj_game.player_hand_current = obj_game.player_hand_list[1]
						player_hand_current_id = 1
					}
				}
			}
			else
			{
				dbg("not enough remaining balance for split")	
			}
		}
	break;
	case btn_hit:
	
		player_hit()
		clear_buttons()
		
	break;
	case btn_stand:
		player_stand()
		//obj_game.alarm[2] = 1	
		clear_buttons()
	break;
	
	case btn_double_down:	
		if obj_game.player_hand_current.bet_value > obj_game.balance_value
		{
			dbg("not enough balance left for double down: " + string(obj_game.player_hand_current.bet_value) + ">" + string(obj_game.balance_value))
			image_alpha = 0.5
			exit
		}
		
		audio_play_sound(Double_Down_v1_wav,1,false)
		
		obj_game.balance_value -= obj_game.player_hand_current.bet_value		
		obj_game.balance_chips = calculate_chip_stack(obj_game.balance_value)
		
		obj_game.double_down = true
		var _new_bet = instance_create_depth(obj_game.player_chips_x,obj_game.player_chips_y,0,obj_coin);
		_new_bet.change_player_hand = obj_game.player_hand_current
		_new_bet.destroy_after_anim = true
		
		
		// move coin
		_new_bet.targetx = obj_game.player_hand_current.bet_x
		_new_bet.targety = obj_game.player_hand_current.bet_y	
		_new_bet.alarm[0] = 1
		_new_bet.change_player_bet = obj_game.player_hand_current.bet_value	
		_new_bet.chip_stack = calculate_chip_stack(obj_game.player_hand_current.bet_value)
	
		//action_add(DEAL_CARD,60,0,[obj_game.player_hand_current])
		action_add(SET_ALARM,60,2,[obj_game,8,1]) // hit
		action_add(SET_ALARM,1,1,[obj_game,9,1])
		action_add(SET_ALARM,1,1,[obj_game,1,1])
		//obj_game.alarm[8] = 60 // player_hit() but with adjustable delay	
		
		
		with(obj_game)
		{
			/*
			if player_hand_current_id == player_splits
				alarm[2] = 110 // make dealer hit
			else
			*/
				player_stand()
		}
		

		clear_buttons()
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
			// create new chip with half of player's bet, move to dealer chips			
			var _new_chip = instance_create_depth(player_hand_current.bet_x,player_hand_current.bet_y,0,obj_coin);
			_new_chip.chip_stack = calculate_chip_stack(obj_game.player_hand_current.bet_value/2)
			action_add(CHANGE_BET,0,0,[player_hand_current,-obj_game.player_hand_current.bet_value/ 2] )
			action_move(0,30,_new_chip,player_chips_x, player_chips_y, 30)
			action_add(DESTROY_OBJECT,0,0,_new_chip)
			action_add(CHANGE_BALANCE,0,0,obj_game.player_hand_current.bet_value / 2)		
			action_add(SET_ALARM,0,0,[obj_game,4,1])
						
			// move remaining bet chips to dealer chips
			player_hand_current.bet_obj.chip_stack = calculate_chip_stack(obj_game.player_hand_current.bet_value/2)
			action_add(SOUND_PLAY,0,0,[Losing_Hand_v1_wav, false])
			action_add(CHANGE_BET,0,0,[player_hand_current,-obj_game.player_hand_current.bet_value/ 2])
			action_move(0,30,player_hand_current.bet_obj,dealer_chips_x, dealer_chips_y, 30)
			action_add(DESTROY_OBJECT,0,0,player_hand_current.bet_obj)
			action_add(SET_ALARM,0,0,[obj_game,4,1])
			/*
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
			*/
		
			// move player's remaining bet chip back to player chips
			/*
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
			*/
			
			alarm[4] = 60
			

			clear_buttons()
		}
	break;
	
	case btn_new_card_shoe:		
	
		with(obj_coin)
		{	
			obj_game.balance_chips = calculate_chip_stack(obj_game.balance_value)
			obj_game.balance_value += change_player_bet
			instance_destroy()	
		}
		
		obj_game.balance_value += obj_game.player_hand_current.bet_value		
		obj_game.balance_chips = calculate_chip_stack(obj_game.balance_value)
		obj_game.player_hand_current.bet_value = 0
		obj_game.alarm[1] = 1 // refresh strings
		
		
		audio_play_sound(New_Card_Shoe_v1_wav,1,false)
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
		
		clear_buttons()
	break;
}