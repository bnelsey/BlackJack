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
					player_stand()
				}
			}
			else if player_hand_current.player_value > 21
			{
				dbg("player bust!")
				player_busts += 1
				
				if not double_down
				{
					player_stand()
				}
			}
			else
			{
				// create standard buttons		
				if not double_down
					obj_game.alarm[7] = 30	
			}
		}
}