
function check_initial_hands_for_wins(){
	
	with(obj_game)
	{
		var _dealer_j21 = false;
		var _player_j21 = false;
		var _dealer_blackjack = false;
		var _player_blackjack = false;	
	
		if player_splits < 1
		if player_hand_current.player_value == 21
		if array_length(player_hand_current.player_cards) == 2
		{
			num_jokers = array_count(player_hand_current.player_cards, 0)
			if num_jokers == 1
			{
				dbg("player has Joker 21!")
				_player_j21 = true;
			}
			else
			{
				dbg("player has normal blackjack!")
				_player_blackjack = true;
			}
		}
	
		if array_length(dealer_cards) == 2
		{
			var _hidden_dealer_value = dealer_value;
			calculate_dealer_card_all()
			var _actual_dealer_value = dealer_value;
			dealer_value = _hidden_dealer_value; // do not change currently displayed dealer value
			
			if _actual_dealer_value == 21
			{
				num_jokers = array_count(dealer_cards, 0)
				if num_jokers == 1
				{
					dbg("dealer has Joker 21!")
					_dealer_j21 = true;
				}
				else
				{
					dbg("dealer has normal blackjack!")
					_dealer_blackjack = true;
				}
			}	
		}
		
		return [_dealer_j21, _player_j21, _dealer_blackjack, _player_blackjack]
	}	
}