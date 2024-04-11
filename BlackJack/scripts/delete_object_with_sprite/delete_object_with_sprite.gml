////// @function delete_object_with_sprite(object_type, sprite_index)
function delete_object_with_sprite(_object_type, _sprite_index)
{
	with(_object_type)
	{
		if sprite_index == _sprite_index
		{
			instance_destroy()		
		}
	}
}