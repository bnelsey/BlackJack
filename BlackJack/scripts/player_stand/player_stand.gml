// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_stand(){
	
	with(obj_hand)
	{
		playing = false	
	}
	
	with(obj_game)
	{
		/*
		if player_hand_current_id == player_splits
			alarm[2] = 1	
		*/
		if player_splits == 0 and player_hand_current_id == 1
		{
			alarm[2] = 1	
		}
		else
		{
			player_card_dealt = 1 // reset cards dealt
			player_hand_current_id += 1
			player_hand_current = player_hand_list[player_hand_current_id]
			alarm[7] = 30
		}
	}
}