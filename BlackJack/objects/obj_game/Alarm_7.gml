/// @description create standard buttons

// auto stand if player is dealt a blackjack
if player_value == 21
{
	alarm[2] = 1
	exit
}

new_button = instance_create_depth(517,894,0,obj_button)
new_button.sprite_index = btn_strategy
new_button.image_alpha = 0.5
new_button = instance_create_depth(694,912,0,obj_button)
new_button.sprite_index = btn_stand
new_button = instance_create_depth(876,917,0,obj_button)
new_button.sprite_index = btn_hit

if array_length(player_cards) < 3
{
	new_button = instance_create_depth(1056,912,0,obj_button)
	new_button.sprite_index = btn_double_down
	new_button = instance_create_depth(1404,834,0,obj_button)
	new_button.sprite_index = btn_surrender		
}