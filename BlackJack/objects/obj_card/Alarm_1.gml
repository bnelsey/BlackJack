/// @description flip dealer card

alarm[1] = 1


		
var _amount = steps_left / steps_total;

switch(flip_stage)
{
	case 0:	
		image_xscale = tween(0, 1, _amount, EASE_OUT_QUAD)	
		steps_left -= 1
		
		if steps_left < 1
		{
			flip_stage = 1
			steps_left = steps_total
			hidden = false
		}
	break;
	case 1:
		image_xscale = tween(1, 0, _amount, EASE_OUT_QUAD)	
		steps_left -= 1
		
		if steps_left < 1
		{
			alarm[1] = -1
			flip_stage = 2
			steps_left = steps_total
			obj_game.alarm[1] = 1 // update card value amount
			image_xscale = 1
		}
	break;	
}