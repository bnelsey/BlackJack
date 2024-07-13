// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function new_card_shoe(){
		if obj_action.alarm[1] > -1 or obj_action.alarm[2] > -1 or instance_exists(obj_tween) 
			or obj_game.alarm[7] > -1 or obj_game.alarm[2] > -1
			exit
	
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
}