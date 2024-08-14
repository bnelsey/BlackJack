/// @description Insert description here
// You can write your code in this editor

alarm[0] = 1
var _amount = steps_left / steps_total;
image_alpha = tween(target_val, start_val, _amount, EASE_IN_QUAD)
	
//dbg("image_alpha",image_alpha)
	
steps_left -= 1	
if steps_left <= 0
{
	image_alpha = 0
	instance_destroy()
}