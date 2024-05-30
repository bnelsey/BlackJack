
function round_end(){
	
	if (dealer_value > player_hand_current.player_value and dealer_value <= 21) or player_hand_current.player_value > 21
	{
		dbg("player loses, bet is given to dealer")		
		
		var _bet_value = player_hand_current.bet_value;
		// move coin new
		action_add(SOUND_PLAY,0,0,[Losing_Hand_v1_wav, false])
		action_add(CHANGE_BET,0,0,[player_hand_current,-_bet_value])
		action_move(0,30,player_hand_current.bet_obj,dealer_chips_x, dealer_chips_y, 30)
		
		action_add(DESTROY_OBJECT,0,0,player_hand_current.bet_obj)
		action_add(SET_ALARM,0,0,[obj_game,4,1])
	}
	else
	if dealer_value == player_hand_current.player_value
	{
		dbg("draw, player keeps bet")
		
		var _bet_value = player_hand_current.bet_value;
		
		// move coin new
		action_add(CHANGE_BET,0,0,[player_hand_current,-_bet_value])
		action_move(0,30,player_hand_current.bet_obj,player_chips_x, player_chips_y, 30)
		action_add(DESTROY_OBJECT,0,0,player_hand_current.bet_obj)
		action_add(CHANGE_BALANCE,0,0,_bet_value)		
		action_add(SET_ALARM,0,0,[obj_game,4,1])
	}
	else // player win
	{
		if dealer_value > 21
			dbg("dealer bust!")
			
		dbg("player wins, dealer pays player his bet amount")
			
		
		// add chips to hand's bet
		var _new_chip = instance_create_depth(dealer_chips_x,dealer_chips_y,0,obj_coin);
		_new_chip.chip_stack = calculate_chip_stack(player_hand_current.bet_y)	
		action_add(SOUND_PLAY,0,0,[Winning_Hand_v1_wav, false])
		action_add(SET_VISIBLE,0,0,[_new_chip, true])
		action_move(0,30,_new_chip,player_hand_current.bet_x, player_hand_current.bet_y, 30)
		action_add(DESTROY_OBJECT,0,0,_new_chip)
		
		
		var _bet = player_hand_current.bet_value
		
		// winnings change depending on specific conditions
		var _winnings = player_hand_current.bet_value;
		
		if player_hand_current.player_value == 21 // for normal blackjack?
			_winnings = (player_hand_current.bet_value/2) * 3
				
		action_add(CHANGE_BET,0,30,[player_hand_current, _winnings]) // 30 frame delay before next action		
		action_add(CHANGE_BET,0,0,[player_hand_current,-(_winnings+_bet)])
		action_add(SOUND_PLAY,0,0,[Add_Chips_to_Betting_Circle_v1_wav, false])
		action_move(0,30,player_hand_current.bet_obj,player_chips_x, player_chips_y, 30)
		action_add(DESTROY_OBJECT,0,0,player_hand_current.bet_obj)
		action_add(CHANGE_BALANCE,0,0,_winnings+_bet)
		action_add(SET_ALARM,0,0,[obj_game,4,1])
	}
}