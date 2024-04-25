/// array_count(type, start_delay, delay_before_next_action, data1, data2)
/// adds an action to the queue
/// Arguments:
///	  - function accepts an array as its only argument
///   - array format: type, start_delay, delay_before_next_action, other_data1, other_data2
///   - type: find under obj_action -> enum ACTION
///   - start_delay: delay before starting this action
///   - delay_before_next_action: delay before starting the next action
///   - data_array: varies per action


function action_add(_array){	
	
	array_push(obj_action.actions, _array)
	
	if obj_action.alarm[1] < 0 and obj_action.alarm[2] < 0
		obj_action.alarm[1] = 1
}