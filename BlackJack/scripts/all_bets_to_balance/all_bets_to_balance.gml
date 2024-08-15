// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function all_bets_to_balance(){

	with(obj_game)
	{
		/*
		with(obj_coin)
		{	
			obj_game.balance_chips = calculate_chip_stack(obj_game.balance_value)
			obj_game.balance_value += change_player_bet
			instance_destroy()	
		}
		*/
		

		// move bets to hand if any			
		for(i=0;i<=2;i+=1)
		{
			modify_hand = player_hand_list[i]
			_bet_value = modify_hand.bet_value
			modify_hand.playing = false
			if _bet_value > 0
			{				
				balance_value += _bet_value
				dbg("returned to balance",_bet_value)
				modify_hand.bet_value = 0
			}
		}
			
		
	}
		
}