/// @description Deal cards



//deal_player_card(0);	
deal_hand_card(0);
deal_dealer_card(false, 10)		
deal_hand_card(20);
//deal_player_card(20)
deal_dealer_card(true, 30)
		
		
//calculate_player_card()
calculate_hand_card()
obj_game.alarm[1] = 50
		
// delete buttons
delete_object_with_sprite(obj_button, btn_deal)
delete_object_with_sprite(obj_button, btn_clear_bet)
			
			
// check if show insurance
var _show_insurance = false;
if dealer_value == 9 or dealer_value == 10 or dealer_value == 11 or dealer_value == 12
{
	_show_insurance = true
	dbg("show insurance!")
}
			
			
// process natural blackjack 
if player_hand_current.player_value == 21
{
	dbg("player blackjack! forced to stand")
	//if not double_down
	if _show_insurance == false
	{
		obj_game.alarm[2] = 90
	}
	else
	{
		// create standard buttons
		obj_game.alarm[7] = 50
	}
}
else
{
	// create standard buttons
	obj_game.alarm[7] = 50
}


