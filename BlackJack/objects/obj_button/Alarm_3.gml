/// @description debug_cards

if async_processed == 0 or async_processed == 2
{
	async_processed = 1	
	async_request = get_string_async("Which cards to place on top of the deck? use card_id #0-57, separated by spaces or commas", "0 1 2 3")
}