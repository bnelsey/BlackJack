// calculate dealer hand's value
function calculate_dealer_card(){

	with(obj_game)
	{
		dealer_cards_temp = [];
		
		with(obj_card)
		{
			if dealer_card == true
			if hidden == false
			{
				array_push(obj_game.dealer_cards_temp, value)
			}
		}
		
		
		len = array_length(dealer_cards_temp)
		dbg(" -------- start dealer cards ------")
		for(i=0; i < len; i+=1)
		{
			dbg(dealer_cards_temp[i])			
		}
		dbg(" -------- end dealer cards ------")
		
	    total_value = array_sum(dealer_cards_temp)
	    num_jokers = array_count(dealer_cards_temp, 0)
	    num_aces = array_count(dealer_cards_temp, 1)

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
		//action_add(CALCULATE_DEALER_VALUE,30,0,[obj_game])
		//action_add(SET_ALARM,0,0,[obj_game,1,1])
	}
}