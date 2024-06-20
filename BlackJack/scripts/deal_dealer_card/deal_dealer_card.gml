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
			targety = dealer_card_y + (dealer_card_dealt * dealer_card_ysep) + card_yoffset
			
			if dealer_card_dealt > 9
			{
				targetx = dealer_card_x - ((dealer_card_dealt-13) * (dealer_card_xsep)) + card_xoffset
				targety = dealer_card_y + (dealer_card_dealt * dealer_card_ysep) + card_yoffset + 165
			}
			else if dealer_card_dealt > 3
			{
				// deal cards to the left
				targetx = dealer_card_x - ((dealer_card_dealt-3) * (dealer_card_xsep)) + card_xoffset
			}
			else
			{
				// deal cards to the right
				targetx = dealer_card_x + (dealer_card_dealt * dealer_card_xsep) + card_xoffset
			}
			
			
			new_card = instance_create_depth(deck_x, deck_y, -dealer_card_dealt, obj_card)
			new_card.image_angle = 44
			new_card.alarm[0] = _startdelay // fix image angle
			audio_play_sound_delayed(Hit_v1_wav, _startdelay)
			dealer_card_dealt += 1
			
			
			
			tween_object(new_card,targetx,targety, 30, _startdelay)
			new_card.targetx = targetx
			new_card.targety = targety
			
			// deal one card from deck array
			dealt_card = array_pop(deck)
			details = get_card_details(dealt_card) // for debugging only
			new_card.sprite_index = details[0]
			new_card.image_index = details[1]	
			new_card.hidden = _hidden

			var _value = get_card_value(dealt_card)
			array_push(dealer_cards,_value) // only push card value to hand
			dbg("dealer card value pushed", _value)
			
			if not _hidden // only calculate non-hidden cards
			{					
				calculate_dealer_card()				
			}
	
			// debugging
			dbg("ID: " + string(dealt_card), "value: " + string(get_card_value(_value)))
			dbg(sprite_get_name(details[0]),details[1])
			
			
			return new_card
		}
}