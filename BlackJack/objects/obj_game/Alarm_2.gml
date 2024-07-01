/// @description dealer keeps hitting until hard 17 or soft 18

// flip animation takes 15x2 frames
// card movement from deck takes 30 frames




hidden_card = find_hidden_card()
			
if hidden_card != noone
{
	hidden_card.alarm[1] = 1
	audio_play_sound(Dealer_Down_Card_Flip_v1_wav,1,false)
	alarm[2] = 30
	exit
}

calculate_dealer_card()
alarm[1] = 1


var _results = check_initial_hands_for_wins();
var _dealer_j21 = _results[0];
var _player_j21 = _results[1];
var _dealer_blackjack = _results[2];
var _player_blackjack = _results[3];	

//msg("soft_hand", soft_hand,"dealer_value", dealer_value)
//msg("player_busts >= player_splits", string(player_busts) + ">=" + string(player_splits+1))
if player_busts >= player_splits+1
{
	alarm[3] = 30
	alarm[2] = -1
	alarm[1] = 1
}
else
{
	// dealer stops playing when value is >= 17 or player has a winning hand
	if dealer_value > 17 or (dealer_value == 17 and soft_hand == false) or (_player_j21 or _player_blackjack)
	{
		alarm[3] = 30
		alarm[2] = -1
	}
	else
	{
		//msg("dealer should hit!","","soft_hand", soft_hand,"dealer_value", dealer_value)	
		deal_dealer_card(false, 1)
		alarm[2] = 30
	}
}
