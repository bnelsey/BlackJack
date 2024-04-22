/// @description  get_card_details(_card_number)
/// @param _card_number
function get_card_details(_card_number) {
	// get the actual value of the card number
	// number is 0-51
	// value is 1-10 (1 can be 11, because blackjack, but that isn't needed in this function)

	var _card_value = (_card_number mod 14);
	var _card_suite = floor(_card_number / 14);
	
	card_name = ""
	card_sprite = spr_card_back
	card_frame = _card_value
	
	// process special cards first	
	switch(_card_value)
	{
		case 0:
			card_name += "Joker"
		break;
		case 11:
			card_name += "Jack"
		break;
		case 12:
			card_name += "Queen"
		break;
		case 13:
			card_name += "King"
		break;
	}
	
	// no need to convert number into a name
	if string_length(card_name) < 1
	{
		card_name += string(_card_value)
	}
	
	card_name += " of " + string(_card_suite) + "/"
	
	switch(_card_suite)
	{
		case 0:
			card_name += "Clubs"
			card_sprite = spr_clubs 
		break;
		case 1:
			card_name += "Diamonds"
			card_sprite = spr_diamonds 
		break;
		case 2:
			card_name += "Hearts"
			card_sprite = spr_hearts 
		break;
		case 3:
			card_name += "Spades"
			card_sprite = spr_spades 
		break;
		case 4:
			card_name += "Specials"
			card_sprite = spr_specials 
			//show_message("card_frame" + string(card_frame))
		break;
		
	}

	//dbg("card_name", card_name)
	card_sprite_frame[0] = card_sprite
	card_sprite_frame[1] = card_frame
	return card_sprite_frame
}
