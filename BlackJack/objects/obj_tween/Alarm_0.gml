/// @description initialize

var _other_tween = find_tween_with_targetobj(id, targetobj);

if _other_tween != noone
	instance_destroy(_other_tween)

if not instance_exists(targetobj)
{
	instance_destroy()
	exit	
}

visible = true
alarm[1] = 1
startx = targetobj.x
starty = targetobj.y
steps_left = steps_total

