/// num_separator(value, separator, digits)
// num_separator(12345678, "_", 3); // Result: 12_345_678
function num_separator(value, separator, digits)
{
	var _value = string(argument0);
	var _sep = argument1;
	var _digits = argument2 - 1;

	var _res = "";

	var _cnt = 0;
	for (var _i=string_length(_value); _i>0; _i--)
	{
	    _res = string_char_at(_value, _i) + _res;
	    if _cnt++ == _digits and _i > 1
	    {
	        _cnt = 0;
	        _res = _sep + _res;
	    }
	}

	return _res;
}