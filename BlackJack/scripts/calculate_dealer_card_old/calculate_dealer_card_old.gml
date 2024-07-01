// calculate dealer hand's value
function calculate_dealer_card_old(){

	with(obj_game)
	{
		
		
		
		len = array_length(dealer_cards)
		dbg(" -------- start dealer cards ------")
		for(i=0; i < len; i+=1)
		{
			dbg(dealer_cards[i])			
		}
		dbg(" -------- end dealer cards ------")
		
	    total_value = array_sum(dealer_cards)
	    num_jokers = array_count(dealer_cards, 0)
	    num_aces = array_count(dealer_cards, 1)

		// if ace or jack's higher value is used, it is a soft hand
		// always reset to false when calculating
		soft_hand = false 
		
	    // Handle Jokers		
	    while (num_jokers > 0 and total_value + 12 <= 21)
		{
	        total_value += 12
	        num_jokers -= 1
			soft_hand = true
		}
		
	    // Handle Aces
	    while (num_aces > 0 and total_value + 10 <= 21)
		{
	        total_value += 10
	        num_aces -= 1
			soft_hand = true
		}


		// update player hand value
		dealer_value = total_value
		//obj_game.alarm[1] = 1
	}
}