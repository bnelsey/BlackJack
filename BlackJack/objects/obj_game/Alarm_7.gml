/// @description create standard buttons

// auto stand if player is dealt a blackjack
if player_value[player_hand_current] == 21
{
	player_stand()
	exit
}

new_button = instance_create_depth(517,894,0,obj_button)
new_button.sprite_index = btn_strategy
new_button.image_alpha = 0.5
new_button = instance_create_depth(694,912,0,obj_button)
new_button.sprite_index = btn_stand
new_button = instance_create_depth(876,917,0,obj_button)
new_button.sprite_index = btn_hit


//msg("player_cards", player_cards, player_cards[0], player_cards[1])
if player_card_dealt == 2 and (player_cards[player_hand_current][0] == player_cards[player_hand_current][1]) and player_splits < 2 and ace_joker_split == false
{
	dbg("player_cards[0]",player_cards[player_hand_current][0], "player_cards[1]", player_cards[player_hand_current][1], "player_splits", player_splits)
	
	new_button = instance_create_depth(1231,894,0,obj_button)
	
	if player_splits== 0
		new_button.sprite_index = btn_split
	else
		new_button.sprite_index = btn_split_again
}

if array_length(player_cards[player_hand_current]) == 2
{
	num_jokers = array_count(player_cards[player_hand_current], 0)
	num_aces = array_count(player_cards[player_hand_current], 1)
	
	// double down button only enabled when there are no soft cards
	if num_jokers + num_aces < 1
	{
		new_button = instance_create_depth(1056,912,0,obj_button)
		new_button.sprite_index = btn_double_down
	}
	
	
	new_button = instance_create_depth(1404,834,0,obj_button)
	new_button.sprite_index = btn_surrender		
}