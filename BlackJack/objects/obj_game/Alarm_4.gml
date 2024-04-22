/// @description make buttons after round end

round_new()
bet_value = 0

with(hand0)
{
	bet_value = 0
	alarm[1] = 1
}
with(hand1)
{
	bet_value = 0
	alarm[1] = 1
}
with(hand2)
{
	bet_value = 0
	alarm[1] = 1
}

player_hand_current_id = 0 // 0 middle, 1 right, 2 left
player_splits = 0
ace_split = false
joker_split = false

new_button = instance_create_depth(694,912,0,obj_button)
new_button.sprite_index = btn_repeat_bet
new_button = instance_create_depth(876,917,0,obj_button)
new_button.sprite_index = btn_repeat_bet_and_deal
new_button = instance_create_depth(1056,912,0,obj_button)
new_button.sprite_index = btn_2x_bet_and_deal