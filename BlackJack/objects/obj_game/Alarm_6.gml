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
			
			
// process natural blackjack 
if player_hand_current.player_value == 21
{
	dbg("player blackjack! forced to stand")
	if not double_down
	{
		obj_game.alarm[2] = 90
	}
}
else
{
	// create standard buttons
	obj_game.alarm[7] = 50
}


