/// @description Insert description here
// You can write your code in this editor


if steps_left > 0
	alarm[1] = 1
else
	instance_destroy()

var _amount = steps_left / steps_total;
targetobj.x = tween(targetx, startx, _amount, EASE_INOUT_QUAD)
targetobj.y = tween(targety, starty, _amount, EASE_INOUT_QUAD)

//dbg("amount",_amount)
//dbg(targetobj.x,targetobj.y)
steps_left -= 1