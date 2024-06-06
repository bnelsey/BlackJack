// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_stand(){
	
	with(obj_hand)
	{
		playing = false	
	}
	
	with(obj_game)
	{
		var _last_hand_done = false;
		var _next_hand = 0;
		
		switch(player_splits)
		{
			case 0:
				_last_hand_done = true
			break;
			case 1:
				if player_hand_current_id == 0
				{
					_last_hand_done = true
				}
				else
				{
					_last_hand_done = false
					_next_hand = 0
				}
			break;
			case 2:
				if player_hand_current_id == 0
				{
					_last_hand_done = false		
					_next_hand = 2
				}
				else if player_hand_current_id == 1
				{
					_last_hand_done = false		
					_next_hand = 0
				}				
				else
				{
					_last_hand_done = true	
				}	
			break;			
		}
		
		
		
			
		if _last_hand_done // if last hand to be played, split or no split
		{
			if not double_down
				alarm[2] = 1	
			else
				alarm[2] = 110 // make dealer hit
		}
		else // not yet last hand to be played because split
		{
			double_down = false
			player_card_dealt = 1 // reset cards dealt
			player_hand_current_id = _next_hand
			player_hand_current = player_hand_list[player_hand_current_id]
			alarm[7] = 30
		}
	}
}