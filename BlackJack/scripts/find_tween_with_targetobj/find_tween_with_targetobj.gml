////// @function find_object_with_sprite(object_type, sprite_index)
function find_tween_with_targetobj(_my_id,_targetobj)
{
	with(obj_tween)
	{
		if targetobj == _targetobj and id != _my_id
		{
			return id
		}
	}
	return noone
}