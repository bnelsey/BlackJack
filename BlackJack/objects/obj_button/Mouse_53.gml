/// @description Insert description here
// You can write your code in this editor


if sprite_index == btn_settings
{
	if mouse_x < 1030 or mouse_y < 79
	{
		// copy pasted button code from btn_settings
		with(obj_game)
		{
			settings_static.visible = false
			with(obj_button)
			{
				if button_section > 0
					instance_deactivate_object(id)
			}
		}
	}	
}



/*
if alarm[0] > -1
	exit

if sprite_index == btn_strategy
{
	with(my_popup)
	{
		instance_destroy()	
	}
	my_popup = noone
}
*/