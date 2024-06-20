
function round_end(){
	
	
	// this section only for initial deal instant wins
	
	// check for j21s and blackjacks
	var _results = check_initial_hands_for_wins();
	var _dealer_j21 = _results[0];
	var _player_j21 = _results[1];
	var _dealer_blackjack = _results[2];
	var _player_blackjack = _results[3];	
		
	// declare win variables
	var _dealer_win = false;
	var _player_win = false;
	var _push = false;	

	// calculate win rankings based on dealer value
	if _dealer_j21 
	{
		if _player_j21
		{
			_push = true
		}
		else
		{
			_dealer_win = true
		}
	}
	else		
	if _dealer_blackjack 
	{
		if _player_j21
		{
			_player_win = true
		}
		else if _player_blackjack
		{
			_push = true
		}
		else
		{
			_dealer_win = true
		}
	}
	else // dealer doesn't have j21 or blackjack
	{
		if _player_j21 or _player_blackjack
		{
			_player_win = true
		}	
	}
		
	// this section only for initial deal instant wins
	
	
	
	if (dealer_value > player_hand_current.player_value and dealer_value <= 21) or player_hand_current.player_value > 21 or _dealer_win
	{
		dbg("player loses, bet is given to dealer")		
		
		var _bet_value = player_hand_current.bet_value;
		// move coin new
		action_add(SOUND_PLAY,0,0,[Losing_Hand_v1_wav, false])
		action_add(CHANGE_BET,0,0,[player_hand_current,-_bet_value])
		action_move(0,30,player_hand_current.bet_obj,dealer_chips_x, dealer_chips_y, 30)
		
		action_add(DESTROY_OBJECT,0,0,player_hand_current.bet_obj)
		//action_add(SET_ALARM,0,0,[obj_game,4,1])
	}
	else
	if not _player_win and (dealer_value == player_hand_current.player_value or _push)
	{
		dbg("draw, player keeps bet")
		
		var _bet_value = player_hand_current.bet_value;
		
		// move coin new
		action_add(CHANGE_BET,0,0,[player_hand_current,-_bet_value])
		action_move(0,30,player_hand_current.bet_obj,player_chips_x, player_chips_y, 30)
		action_add(DESTROY_OBJECT,0,0,player_hand_current.bet_obj)
		action_add(CHANGE_BALANCE,0,0,_bet_value)		
		//action_add(SET_ALARM,0,0,[obj_game,4,1])
	}
	else // player win
	{
		if dealer_value > 21
			dbg("dealer bust!")
			
		dbg("player wins, dealer pays player his bet amount")
			
		
		// add chips to hand's bet
		var _new_chip = instance_create_depth(dealer_chips_x,dealer_chips_y,0,obj_coin);
		action_add(SOUND_PLAY,0,0,[Winning_Hand_v1_wav, false])
		action_add(SET_VISIBLE,0,0,[_new_chip, true])
		action_move(0,30,_new_chip,player_hand_current.bet_x, player_hand_current.bet_y, 30)
		action_add(DESTROY_OBJECT,0,0,_new_chip)
		
		
		var _bet = player_hand_current.bet_value
		
		// winnings change depending on specific conditions
		var _winnings = player_hand_current.bet_value;
		
		if player_hand_current.player_value == 21
		if player_splits < 1
		if array_length(player_hand_current.player_cards) == 2
		{
			num_jokers = array_count(player_hand_current.player_cards, 0)
			if array_length(player_hand_current.player_cards) == 2 and num_jokers == 1
			{
				dbg("Joker 21! payout is 2:1")
				_winnings = player_hand_current.bet_value*2 // for normal blackjack?
			}
			else
			{
				dbg("normal blackjack! payout is 3:2")
				_winnings = (player_hand_current.bet_value/2) * 3 // for normal blackjack?
			}
		}
		
		_new_chip.chip_stack = calculate_chip_stack(_winnings)	
				
		action_add(CHANGE_BET,0,30,[player_hand_current, _winnings]) // 30 frame delay before next action		
		action_add(CHANGE_BET,0,0,[player_hand_current,-(_winnings+_bet)])
		action_add(SOUND_PLAY,0,0,[Add_Chips_to_Betting_Circle_v1_wav, false])
		action_move(0,30,player_hand_current.bet_obj,player_chips_x, player_chips_y, 30)
		action_add(DESTROY_OBJECT,0,0,player_hand_current.bet_obj)
		action_add(CHANGE_BALANCE,0,0,_winnings+_bet)
		//action_add(SET_ALARM,0,0,[obj_game,4,1])
	}
}