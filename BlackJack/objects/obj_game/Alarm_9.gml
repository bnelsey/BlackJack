/// @description calculate hand values


//calculate_dealer_card()	


var _current_hand_temp = player_hand_current;	
player_hand_current = player_hand_list[0]
calculate_hand_card()
player_hand_current = player_hand_list[1]
calculate_hand_card()
player_hand_current = player_hand_list[2]
calculate_hand_card()
player_hand_current = _current_hand_temp // return to original hand

/*
var _temp_player_hand_current = player_hand_current;

player_hand_current = player_hand_list[0]
calculate_hand_card()
player_hand_current = player_hand_list[1]
calculate_hand_card()
player_hand_current = player_hand_list[2]
calculate_hand_card()

player_hand_current = _temp_player_hand_current
*/