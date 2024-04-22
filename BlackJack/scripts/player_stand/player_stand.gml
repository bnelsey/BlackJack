// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_stand(){
	
	with(obj_game)
	{
		if player_hand_current == player_splits
			alarm[2] = 1	
		else
		{
			player_card_dealt = 1 // reset cards dealt
			player_hand_current += 1
			alarm[7] = 30
		}
	}
}