/// @description calculate_player_card(_hand_number)
/// @param _hand_number
// calculate player hand's value
function calculate_player_card(_hand_number){
	
	

	with(obj_game)
	{
		len = array_length(player_cards[_hand_number])
		
		
		dbg(" -------- start player cards ------", len)
		for(i=0; i < len; i+=1)
		{
			dbg(player_cards[_hand_number][i])			
		}
		dbg(" -------- end player cards ------")
		
	    total_value = array_sum(player_cards[_hand_number])
	    num_jokers = array_count(player_cards[_hand_number], 0)
	    num_aces = array_count(player_cards[_hand_number], 1)

	    // Handle Jokers		
	    while (num_jokers > 0 and total_value + 12 <= 21)
		{
	        total_value += 12
	        num_jokers -= 1
		}
		
	    // Handle Aces
	    while (num_aces > 0 and total_value + 10 <= 21)
		{
	        total_value += 10
	        num_aces -= 1
		}

		/*
		if total_value == 21
			msg("blackjack!")
		*/
		
		// update player hand value
		player_value[_hand_number] = total_value
		dbg(">>>>player_value[_hand_number]", player_value[_hand_number])
		obj_game.alarm[1] = 1
	}
}