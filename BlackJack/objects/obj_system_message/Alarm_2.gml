/// @description fadeout

if image_alpha > 0
{
	y -= move_up_speed
	image_alpha -= fadeout_spd	
}


if image_alpha <= 0
{
	image_alpha = 0	//sanity check, important for HTML5 version
	instance_destroy()
}
else
{
	alarm[2] = 1
}