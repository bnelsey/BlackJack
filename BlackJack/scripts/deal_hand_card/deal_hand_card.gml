// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function deal_hand_card(_startdelay){
		if array_length(obj_game.deck) < 1
		{
			msg("no more cards left in deck! restarting game")
			game_restart()
			exit
		}
			
		with(obj_game.player_hand_current)
		{		
			player_card_dealt = array_length(player_card_instances)
			
			// make one card object
			targetx = player_card_x + (player_card_dealt * player_card_xsep) + card_xoffset
			targety = player_card_y + (player_card_dealt * player_card_ysep) + card_yoffset
			new_card = instance_create_depth(obj_game.deck_x, obj_game.deck_y, -player_card_dealt, obj_card)
			//player_card_dealt += 1
			
			tween_object(new_card,targetx,targety, 30, _startdelay)
			
			array_push(player_card_instances, new_card.id)
			
			
			// deal one card from deck array
			dealt_card = array_pop(obj_game.deck)
			details = get_card_details(dealt_card) // for debugging only
			new_card.sprite_index = details[0]
			new_card.image_index = details[1]	
			var _value = get_card_value(dealt_card)
			array_push(player_cards,_value) // only push card value to hand
	
			// debugging
			dbg("ID: " + string(dealt_card), "value: " + string(_value))
			dbg(sprite_get_name(details[0]),details[1])
			
			return new_card
		}
}