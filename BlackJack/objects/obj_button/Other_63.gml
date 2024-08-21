// async question handling

// prevent async requests from running more than once per request
if async_processed != 1
	exit

var i_d = ds_map_find_value(async_load, "id");
if (i_d == async_request)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
			async_processed = 2
            var _cards_to_place = ds_map_find_value(async_load, "result");
			dbg("cards to place on top of deck:", _cards_to_place)
			var _new_card_array = string_split_ext(_cards_to_place, [",", " "]);
			
			for(var _i=0; _i < array_length(_new_card_array); _i+=1)
			{
				try
				{
					_new_card_array[_i] = real(_new_card_array[_i])		
				}
				catch( _exception)
				{
				    show_message_async("error: " + _exception.message);
					exit
				}
			}
			_new_card_array = array_reverse(_new_card_array)
			obj_game.deck = array_concat(obj_game.deck, _new_card_array)
			dbg("deck", obj_game.deck)
			
		
			// copy pasted code from settings button to automatically close settings
			with(obj_game)
			{
				settings_static.visible = false
				
				settings_about_ads.visible = false
				settings_about_ads_arrow.visible = false
				with(obj_button)
				{
					if button_section > 0
						instance_deactivate_object(id)
				}
			}
        }
    }
}