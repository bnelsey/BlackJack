/// @description all steps

alarm[0]= 1

// stuff happens in between every line

initialize_step_check = 0


if initialize_step != initialize_step_previous
{
	dbg("initialize_step", initialize_step)
	initialize_step_previous = initialize_step
}






// ---------------------------------------------------------------
// zoom in intro1
if initialize_step == initialize_step_check
{
	var _amount = steps_left / steps_total;
	image_xscale = tween(target_val, start_val, _amount, EASE_INOUT_QUAD)
	image_yscale = image_xscale
	

	dbg("image_xscale",image_xscale)
	
	steps_left -= 1
	
	if steps_left <= 0
	{
		dbg("done zooming in")
		initialize_step += 1
		alarm[0] = room_speed * 1
		
		// reset tween variables
		start_val = image_xscale
		target_val = 0.1
		steps_total = room_speed * 0.25
		steps_left = steps_total
	}	
	exit
}
initialize_step_check += 1

// ---------------------------------------------------------------
// zoom out intro 1
if initialize_step == initialize_step_check
{
	var _amount = steps_left / steps_total;
	image_xscale = tween(target_val, start_val, _amount, EASE_INOUT_QUAD)
	image_yscale = image_xscale
	

	dbg("image_xscale",image_xscale)
	
	steps_left -= 1
	
	if steps_left <= 0
	{
		dbg("done zooming out")
		initialize_step += 1
		alarm[0] = 1
		
		sprite_index = spr_intro2
		
		// reset tween variables
		start_val = image_xscale
		target_val = 1
		steps_total = room_speed * 0.25
		steps_left = steps_total
	}	
	exit
}
initialize_step_check += 1
// ---------------------------------------------------------------
// zoom in intro2
if initialize_step == initialize_step_check
{
	var _amount = steps_left / steps_total;
	image_xscale = tween(target_val, start_val, _amount, EASE_INOUT_QUAD)
	image_yscale = image_xscale
	

	dbg("image_xscale",image_xscale)
	
	steps_left -= 1
	
	if steps_left <= 0
	{
		dbg("done zooming in")
		initialize_step += 1
		alarm[0] = room_speed * 1
		
		sprite_index = spr_intro2
		
		// reset tween variables
		start_val = image_xscale
		target_val = 0
		steps_total = room_speed * 0.5
		steps_left = steps_total
	}	
	exit
}
initialize_step_check += 1

// ---------------------------------------------------------------
// zoom out intro 1
if initialize_step == initialize_step_check
{
	var _amount = steps_left / steps_total;
	image_xscale = tween(target_val, start_val, _amount, EASE_INOUT_QUAD)
	image_yscale = image_xscale
	

	dbg("image_xscale",image_xscale)
	
	steps_left -= 1
	
	if steps_left <= 0
	{
		dbg("done zooming out")
		image_alpha = 0
		visible = false
		initialize_step += 1
		alarm[0] = 1
	}	
	exit
}
initialize_step_check += 1
// ---------------------------------------------------------------
if initialize_step == initialize_step_check
{
	alarm[0] = -1 // stop running
	room_goto(rm_init)
	exit
}
initialize_step_check += 1
