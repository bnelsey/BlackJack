/// @description create standard buttons

// auto stand if player is dealt a blackjack
if player_hand_current.player_value == 21 or ace_joker_split == true
{
	player_stand()
	//alarm[2] = 1
	exit
}

new_button = instance_create_depth(517,894,0,obj_button)
new_button.sprite_index = btn_strategy
new_button.image_alpha = 0.5
new_button = instance_create_depth(694,912,0,obj_button)
new_button.sprite_index = btn_stand
new_button = instance_create_depth(876,917,0,obj_button)
new_button.sprite_index = btn_hit

// check if insurance button should be shown
if array_length(player_hand_current.player_cards) == 2 and player_splits < 1 and insurance_taken == false
{
	if dealer_value == 9 or dealer_value == 10 or dealer_value == 11 or dealer_value == 12
	{
		new_button = instance_create_depth(1577,743,0,obj_button)
		new_button.sprite_index = btn_insurance
	}
}

// check if split button should be shown
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