// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sysmsg(_x, _y, _msg){
	
	with(obj_system_message)
	{
		instance_destroy()	
	}
	
	var _new_message = instance_create_depth(_x,_y, -99999, obj_system_message);
	_new_message.drawtext = _msg
	return _new_message
}