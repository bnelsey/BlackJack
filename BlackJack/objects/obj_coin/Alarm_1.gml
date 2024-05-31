/// @description movement animation

	
if steps_left > 0
	alarm[1] = 1 // animate
else
{
	alarm[2] = 1 // change values on animation end
}

var _amount = steps_left / steps_total;
x = tween(targetx, startx, _amount, EASE_INOUT_QUAD)
y = tween(targety, starty, _amount, EASE_INOUT_QUAD)

//dbg("amount",_amount)
//dbg(x,y)
steps_left -= 1