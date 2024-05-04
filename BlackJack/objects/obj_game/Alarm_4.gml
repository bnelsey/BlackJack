/// @description make buttons after round end

round_new()
//clear_hand_values()
//bet_value = 0


player_hand_current_id = 0 // 0 middle, 1 right, 2 left
player_splits = 0
ace_joker_split = false

new_button = instance_create_depth(694,912,0,obj_button)
new_button.sprite_index = btn_repeat_bet
new_button = instance_create_depth(876,917,0,obj_button)
new_button.sprite_index = btn_repeat_bet_and_deal
new_button = instance_create_depth(1056,912,0,obj_button)
new_button.sprite_index = btn_2x_bet_and_deal