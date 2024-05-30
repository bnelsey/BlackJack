// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calculate_chip_stack(_chip_value){
	var _subimage_array = []
	
	// with(obj_game) because we need chip_values array
	with(obj_game)
	{
		var _temp_balance_value = _chip_value
		for (var _i = array_length(chip_values)-1; _i >= 0; _i-=1) {
		    var _value = chip_values[_i];
		    var _count = floor(_temp_balance_value / _value);
		    _temp_balance_value -= _value * _count;
	
			for(var _k = 0; _k < _count; _k +=1)
			{
				array_push(_subimage_array, _i)
			}
		}
	}
	
	dbg("chip stack value", _chip_value, "chip stack",_subimage_array)
	
	return _subimage_array;
}