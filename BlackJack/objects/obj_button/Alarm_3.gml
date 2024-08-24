/// @description debug_cards

dbg("attempting to show custom hand window")
if global.async_processed == 0 or global.async_processed == 2
{
	global.async_processed = 1	
	dbg("showing custom hand window")
	async_request = get_string_async("Which cards to place on top of the deck? use card_id #0-57, separated by spaces or commas", "0 1 9 11")
}