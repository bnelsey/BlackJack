/// @description Insert description here
// You can write your code in this editor



var _cards_left = array_length(deck);
if _cards_left < 1
{
	if instance_exists(top_of_deck)
	{
		with(top_of_deck)
		{
			instance_destroy()	
		}
		top_of_deck = noone
	}
}