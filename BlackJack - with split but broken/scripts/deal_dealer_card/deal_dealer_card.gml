// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function deal_dealer_card(_hidden, _startdelay){
	
		if array_length(obj_game.deck) < 1
		{
			msg("no more cards left in deck! restarting game")
			game_restart()
			exit
		}
		
		with(obj_game)
		{
			// make one card object
			targetx = dealer_card_x + (dealer_card_dealt * dealer_card_xsep) + card_xoffset
			targety = dealer_card_y + (dealer_card_dealt * dealer_card_ysep) + card_yoffset
			new_card = instance_create_depth(deck_x, deck_y, -dealer_card_dealt, obj_card)
			dealer_card_dealt += 1
			
			tween_object(new_card,targetx,targety, 30, _startdelay)
			
			// deal one card from deck array
			dealt_card = array_pop(deck)
			details = get_card_details(dealt_card) // for debugging only
			new_card.sprite_index = details[0]
			new_card.image_index = details[1]	
			new_card.hidden = _hidden
			
			array_push(dealer_cards,get_card_value(details[1]))
			if not _hidden // only calculate non-hidden cards
			{					
				calculate_dealer_card()				
			}
	
			// debugging
			dbg("ID: " + string(dealt_card), "value: " + string(get_card_value(dealt_card)))
			dbg(sprite_get_name(details[0]),details[1])
			
			
			return new_card
		}
}