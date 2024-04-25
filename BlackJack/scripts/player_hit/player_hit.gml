// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_hit(){
		with(obj_game)
		{
			if player_hand_current.player_value < 21
			{
				deal_hand_card(0)		
				calculate_hand_card()
			}			
			
			if player_hand_current.player_value == 21
			{
				dbg("player blackjack!")
				if not double_down
				{
					obj_game.alarm[2] = 1	
					//player_hand_current.alarm[2] = 1
				}
			}
			else if player_hand_current.player_value > 21
			{
				dbg("player bust!")
				
				// open dealer card and calculate
				hidden_card = find_hidden_card()			
				if hidden_card != noone
				{
					hidden_card.alarm[1] = 1
				}
				calculate_dealer_card()
				
				if not double_down
					obj_game.alarm[3] = 30
			}
			else
			{
				// create standard buttons		
				if not double_down
					obj_game.alarm[7] = 30	
			}
		}
}