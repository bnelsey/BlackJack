/// @description Insert description here
// You can write your code in this editor

//if os_type == os_android
if sprite_index == btn_deal and clicked
{
	var _hold_time = current_time - click_time;
	//msg("_hold_time",_hold_time)
	
	if _hold_time > 9000
	{
		alarm[3] = 1
	}
	else
	{
		clear_hand_values()
		obj_game.alarm[6] = 1
		click_time = current_time
	}
}
