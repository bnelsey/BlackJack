// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function clear_bet_values(){

	with(obj_game)
	{
		with(hand0)
		{
			bet_value = 0
			alarm[1] = 1
		}
		with(hand1)
		{
			bet_value = 0
			alarm[1] = 1
		}
		with(hand2)
		{
			bet_value = 0
			alarm[1] = 1
		}
	}
}