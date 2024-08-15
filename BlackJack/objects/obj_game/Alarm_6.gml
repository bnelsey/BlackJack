/// @description Deal cards



// deal four cards
deal_hand_card(0);
deal_dealer_card(false, 10)		
deal_hand_card(20);
deal_dealer_card(true, 30)
		
calculate_dealer_card()
calculate_hand_card()

obj_game.alarm[1] = 50




// delete buttons
delete_object_with_sprite(obj_button, btn_deal)
delete_object_with_sprite(obj_button, btn_clear_bet)
			
			
// check if show insurance
var _show_insurance = false;
if dealer_value == 11 or dealer_value == 12
{
	_show_insurance = true
	dbg("show insurance!")
}
			
			
// always peek possible blackjack j21 dealer cards
if dealer_value == 9 or dealer_value == 10 //or dealer_value == 11 or dealer_value == 12 // peek, then skip playing
{
	var _hidden_card = find_hidden_card();		
	if instance_exists(_hidden_card)
	{
		action_add(MOVE_OBJECT,90,60,[_hidden_card,1331+56,21+79,30,0])
		action_add(MOVE_OBJECT,1,30,[_hidden_card,_hidden_card.targetx,_hidden_card.targety, 30,0])
	}
}
	
	
// automatic peeks when player has blackjack/j21 and dealer potentially also has the same winning hand rank
var _results = check_initial_hands_for_wins();
var _dealer_j21 = _results[0];
var _player_j21 = _results[1];
var _dealer_blackjack = _results[2];
var _player_blackjack = _results[3];	
	
dbg("initial hands _results", _results)
		
if _dealer_j21 and dealer_value == 9 // skip playing no matter what if dealer has j21 AND upcard is 9
{
	action_add(SET_ALARM,1,1,[obj_game,2,1]) 
	exit
}

if _dealer_blackjack and dealer_value == 10 and player_value < 21  // skip playing no matter what
{
	action_add(SET_ALARM,1,1,[obj_game,2,1]) 
	exit
}
	
// process natural blackjack 
if player_hand_current.player_value == 21
{
	dbg("player blackjack! forced to stand")	
	
				
	if _player_j21 // skip playing
	{
		if dealer_value == 9 // peek, then skip playing
		{
			//msg("show peek animation here! 1")
			action_add(SET_ALARM,1,1,[obj_game,2,90]) // skip playing
			exit
		}		
		else if dealer_value == 12
		{
			//msg("offer j21 even money here")
			action_add(SET_ALARM,1,1,[obj_game,7,50]) // regular play
			exit
		}
	}
	
	if _player_blackjack // skip playing
	{
		if dealer_value == 10 // peek, then skip playing
		{
			//msg("show peek animation here! 2")
			action_add(SET_ALARM,1,1,[obj_game,2,90]) // skip playing
			exit
		}		
		else if dealer_value == 11
		{
			//msg("offer blackjack even money here")
			action_add(SET_ALARM,1,1,[obj_game,7,50]) // regular play
			exit
		}
	}
	
	if _show_insurance == false or _player_j21 == true // skip playing
	{
		//obj_game.alarm[2] = 90
		action_add(SET_ALARM,1,1,[obj_game,2,90]) // skip playing
	}
	else // regular play
	{
		// create standard buttons
		//obj_game.alarm[7] = 50
		action_add(SET_ALARM,1,1,[obj_game,7,50]) // regular play
	}
}
else
{
	// create standard buttons
	//obj_game.alarm[7] = 50
	action_add(SET_ALARM,1,1,[obj_game,7,50]) // regular play
}


