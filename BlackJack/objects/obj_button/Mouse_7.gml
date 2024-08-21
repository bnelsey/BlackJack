/// @description Insert description here
// You can write your code in this editor

//if os_type == os_android
if button_section == SETTINGS_HIDDEN and clicked
{
	var _hold_time = current_time - click_time;
	//msg("_hold_time",_hold_time)
	clicked = false
	if _hold_time > 1000
	{
		alarm[3] = 1
	}
}
