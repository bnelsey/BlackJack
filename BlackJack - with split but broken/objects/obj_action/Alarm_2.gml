/// @description perform action
// array format: type, start_delay, delay_before_next_action, other_data1, other_data2

var _action_type = actions[0][0];
var _start_delay = actions[0][1];
var _delay_before_next_action = actions[0][2];
var _data1 = actions[0][3];
var _data2 = 0;
var _data3 = 0;
var _data4 = 0;
var _data5 = 0;

alarm[1] = _delay_before_next_action

// data1 is instance ID most of the time
// data2 and 3 will usually be x and y location
switch(_action_type)
{
	case MOVE_OBJECT:
		_data2 = actions[0][4];
		_data3 = actions[0][5];
		_data4 = actions[0][6];
		_data5 = actions[0][7];
		
		tween_object(_data1, _data2, _data3, _data4, _data5)	
	break
	
	case DESTROY_OBJECT:
		instance_destroy(_data1)
	break
	
	case CHANGE_BET:
		
	break;
	
	case DEBUG_MESSAGE:
		show_message(_data1)	
	break;
}



array_shift(actions) // remove first element in array since it's already used above