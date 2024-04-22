// calculate player hand's value
function calculate_player_card(){
	
	

	with(obj_game)
	{
		len = array_length(player_cards)
		
		
		dbg(" -------- start player cards old ------")
		for(i=0; i < len; i+=1)
		{
			dbg(player_cards[i])			
		}
		dbg(" -------- end player cards old ------")
		
	    total_value = array_sum(player_cards)
	    num_jokers = array_count(player_cards, 0)
	    num_aces = array_count(player_cards, 1)

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
		player_value = total_value
		obj_game.alarm[1] = 1
	}
}