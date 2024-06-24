/// @description create standard buttons

// check if show insurance
var _show_insurance = false;
if dealer_value == 11 or dealer_value == 12
{
	_show_insurance = true
	dbg("show insurance!")
}

if regular_play_resume or insurance_taken == true
{
	_show_insurance = false
	dbg("regular play resume, don't show insurance!")
}

var _results = check_initial_hands_for_wins();
var _dealer_j21 = _results[0];
var _player_j21 = _results[1];
var _dealer_blackjack = _results[2];
var _player_blackjack = _results[3];	

// show even money buttons
var _show_even_money = false;
if (_player_j21 and dealer_value == 12) or (_player_blackjack and dealer_value == 11)
{
	even_money_obj = instance_create_depth(1081,839,0,obj_static)
	even_money_obj.sprite_index = spr_even_money
	
	new_button = instance_create_depth(1041,912,0,obj_button)
	new_button.sprite_index = btn_yes
	new_button = instance_create_depth(1214,912,0,obj_button)
	new_button.sprite_index = btn_no	
	_show_even_money = true
}


// auto stand if player is dealt a blackjack and don't need to show insurance
if (player_hand_current.player_value == 21 or ace_joker_split == true) and _show_insurance == false
{
	dbg("player auto stand")
	player_stand()
	//regular_play_resume = false // reset regular play
	//alarm[2] = 1
	exit
}

new_button = instance_create_depth(1753,913,0,obj_button)
new_button.sprite_index = btn_strategy


if not(_show_insurance == true or _show_even_money == true) or regular_play_resume == true
{
	new_button = instance_create_depth(694,912,0,obj_button)
	new_button.sprite_index = btn_stand
}

if player_hand_current.player_value < 21 and (not _show_insurance or insurance_taken)
{
	new_button = instance_create_depth(876,917,0,obj_button)
	new_button.sprite_index = btn_hit
}

// check if insurance button should be shown
if array_length(player_hand_current.player_cards) == 2 and player_splits < 1 and insurance_taken == false
{
	if _show_insurance == true and _show_even_money == false
	{
		/*
		new_button = instance_create_depth(1577,743,0,obj_button)
		new_button.sprite_index = btn_insurance
		*/
		
		even_money_obj = instance_create_depth(1081,839,0,obj_static)
		even_money_obj.sprite_index = spr_insurance_question
	
		new_button = instance_create_depth(1041,912,0,obj_button)
		new_button.sprite_index = btn_insurance_yes
		new_button = instance_create_depth(1214,912,0,obj_button)
		new_button.sprite_index = btn_insurance_no	
	}
}

// check if split button should be shown
if (not _show_insurance or insurance_taken)
if array_length(player_hand_current.player_cards) == 2 and (player_hand_current.player_cards[0] == player_hand_current.player_cards[1]) and player_splits < 2 and ace_joker_split == false
{
	dbg("player_cards[0]",player_hand_current.player_cards[0], "player_cards[1]", player_hand_current.player_cards[1], "player_splits", player_splits)
	new_button = instance_create_depth(1231,894,0,obj_button)
	
	if player_splits== 0
		new_button.sprite_index = btn_split
	else
		new_button.sprite_index = btn_split_again
}

// check if double down or surrender should be shown
if array_length(player_hand_current.player_cards) < 3 
{
	num_jokers = array_count(player_hand_current.player_cards, 0)
	num_aces = array_count(player_hand_current.player_cards, 1)
	
	// double down button only enabled when there are no soft cards
	
	//if num_jokers + num_aces < 1
	if player_hand_current.player_value < 21 and (not _show_insurance or insurance_taken)
	{
		new_button = instance_create_depth(1056,912,0,obj_button)
		new_button.sprite_index = btn_double_down
	}
		
	if player_splits < 1
	{
		new_button = instance_create_depth(1404,834,0,obj_button)
		new_button.sprite_index = btn_surrender		
	}
}

if player_splits > 0
{
	// only start blink sequence if it's not already started
	if player_hand_current.playing == false
	{
		with(obj_hand)
		{
			playing = false	
		}
		
		player_hand_current.playing = true	
		player_hand_current.alarm[2] = 1
	}
}


//regular_play_resume = false // reset regular play