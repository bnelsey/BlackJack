/// @description  card_value(_card_number)
/// @param _card_number
function get_card_value(_card_number) {
	// get the actual value of the card number
	// number is 0-51
	// value is 1-10 (1 can be 11, because blackjack, but that isn't needed in this function)

	var card_value = (_card_number mod 14);
	var _card_suite = floor(_card_number / 14); // id#0-3 are the 4 suites, special cards are id#4
	
	if(card_value > 9) 
	{
	    card_value = 10;
	}

		
	//get_card_details(_card_number) // for debugging only
	
	if _card_suite > 3
	{
		dbg("card suite > 3, joker so 0 value returned")
		return 0
	}
	
	return card_value;



}
