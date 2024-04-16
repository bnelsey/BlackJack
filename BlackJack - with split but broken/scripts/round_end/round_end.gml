
function round_end(){
	
	if (dealer_value > player_value[player_hand_current] and dealer_value <= 21) or player_value[player_hand_current] > 21
	{
		dbg("player loses, bet is given to dealer")
		// move coin
		if instance_exists(obj_coin)
		{
			obj_coin.targetx = dealer_chips_x
			obj_coin.targety = dealer_chips_y
			obj_coin.alarm[0] = 1 // start moving	
			obj_coin.destroy_after_anim = true
		}
		bet_value[0] = 0
		alarm[1] = 1
		alarm[4] = 30
	}
	else
	if dealer_value == player_value[player_hand_current]
	{
		dbg("draw, player keeps bet")
		
		// move coin
		if instance_exists(obj_coin)
		{
			obj_coin.targetx = player_chips_x
			obj_coin.targety = player_chips_y
			obj_coin.change_player_balance = bet_value[0]	
			obj_coin.destroy_after_anim = true
			obj_coin.alarm[0] = 1 // start moving
		}
		bet_value[0] = 0
		alarm[4] = 30
	}
	else // player win
	{
		if dealer_value > 21
			dbg("dealer bust!")
			
		dbg("player wins, dealer pays player his bet amount")
		
		var _new_chip = instance_create_depth(dealer_chips_x,dealer_chips_y,0,obj_coin);
		// move chip
		_new_chip.targetx = bet_x[0]
		_new_chip.targety = bet_y[0]		
		_new_chip.alarm[0] = 1
		_new_chip.destroy_after_anim = true
		
		if player_value[player_hand_current] == 21
			_new_chip.change_player_bet = (bet_value[0]/2) * 3
		else
			_new_chip.change_player_bet = bet_value[0]
		
		
		if instance_exists(obj_game.bet_obj)
		{
			_new_chip = obj_game.bet_obj
		}
		else
		{
			_new_chip = instance_create_depth(dealer_chips_x,dealer_chips_y,0,obj_coin);
		}
		// move chip
		_new_chip.targetx = player_chips_x
		_new_chip.targety = player_chips_y	
		_new_chip.alarm[0] = 60
		_new_chip.destroy_after_anim = true
		if player_value[player_hand_current] == 21
			_new_chip.change_player_balance = bet_value[0] + ((bet_value[0]/2) * 3)
		else
			_new_chip.change_player_balance = bet_value[0]*2
		//_new_chip.change_player_bet = -bet_value*2
		
		alarm[4] = 60
	}
}