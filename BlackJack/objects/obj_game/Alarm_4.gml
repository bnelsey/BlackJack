/// @description make buttons after round end

round_new()
dbg("bet value reset to 0 after this, but current bet value is", bet_value)
bet_value = 0

new_button = instance_create_depth(694,912,0,obj_button)
new_button.sprite_index = btn_repeat_bet
new_button = instance_create_depth(876,917,0,obj_button)
new_button.sprite_index = btn_repeat_bet_and_deal
new_button = instance_create_depth(1056,912,0,obj_button)
new_button.sprite_index = btn_2x_bet_and_deal