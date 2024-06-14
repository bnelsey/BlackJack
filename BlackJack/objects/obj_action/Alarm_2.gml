/// @description perform action
// array format: type, start_delay, delay_before_next_action, [other_data1, other_data2]

var _action_type = actions[0][0];
var _start_delay = actions[0][1];
var _delay_before_next_action = actions[0][2];
var _data_array = actions[0][3];

alarm[1] = _delay_before_next_action + 1

// data1 is instance ID most of the time
// data2 and 3 will usually be x and y location
switch(_action_type)
{
	// move_object is probably only useful if it -has- to be done in a specific order
	case MOVE_OBJECT:		
		dbg("move object")
		tween_object( _data_array[0], _data_array[1],  _data_array[2], _data_array[3], 0)	
	break
	
	case DESTROY_OBJECT:
		dbg("destroy object")
		instance_destroy(_data_array[0])
	break
	
	case CHANGE_BET:
		dbg("change bet")
		var _change_player_hand = _data_array[0];
		_change_player_hand.bet_value += _data_array[1]
		_change_player_hand.alarm[1] = 1
		//_change_player_hand.bet_obj.image_alpha = 0.5
		
		// only change chip stack if bet increases
		if _data_array[1] > 0
		{
			_change_player_hand.bet_obj.chip_stack = calculate_chip_stack(_change_player_hand.bet_value)		
		}
	break;
	
	case CHANGE_BALANCE:
		dbg("change balance")
		obj_game.balance_value += _data_array[0]
		obj_game.alarm[1] = 1
		obj_game.balance_chips = calculate_chip_stack(obj_game.balance_value)
	break;
	
	
	case CHANGE_INSURANCE:
		dbg("change insurance")
		obj_game.insurance_value += _data_array[0]
		obj_game.alarm[1] = 1
	break;
	
	case CHIP_STACK:
		dbg("change insurance")
		var _coin_to_calculate_chip_stack = _data_array[0];
		_coin_to_calculate_chip_stack.chip_stack = calculate_chip_stack(_data_array[1])
	break;
	
	case SOUND_PLAY:
		dbg("sound play")
		audio_play_sound(_data_array[0], 1, _data_array[1])		
	break;
	
	case DEBUG_MESSAGE:
		show_message(_data_array[0])	
	break;
	
	case DEBUG_PRINT:
		dbg(_data_array[0])	
	break;
	case SET_VISIBLE:
		dbg("set instance visible", _data_array[0])
		_data_array[0].visible = _data_array[1]
	break;
	case SET_ALARM:
		dbg("set alarm")
		dbg("which instance", _data_array[0])
		dbg("alarm[] number", _data_array[1])
		dbg("alarm[] value", _data_array[2])
		_data_array[0].alarm[_data_array[1]] = _data_array[2]
	break;
	case DEAL_CARD:
		dbg("deal card")
		dbg("which hand", _data_array[0])
		var _temp_hand_current = obj_game.player_hand_current;
		obj_game.player_hand_current = _data_array[0]
		deal_hand_card(0);
		obj_game.player_hand_current = _temp_hand_current // revert current hand to original 
	break;
}



array_shift(actions) // remove first element in array since it's already used above