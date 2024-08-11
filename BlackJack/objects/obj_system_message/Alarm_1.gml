/// @description fadein

	
if image_alpha < 1
{
	image_alpha += fadein_spd	
}


if image_alpha >= 1
{
	image_alpha = 1	//sanity check, important for HTML5 version
	alarm[2] = stay_time
}
else
{
	alarm[1] = 1
}