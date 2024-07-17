/// @description Insert description here
// You can write your code in this editor

if first_click_done == false
{
	first_click_done = true
	audio_master_gain(global.volume)
	alarm[11] = 1
}

with(my_popup)
{
	timediff = obj_game.my_popup_created_on - current_time
	if abs(timediff) > 100
	{
		obj_game.my_popup = noone
		instance_destroy()	
	}
}