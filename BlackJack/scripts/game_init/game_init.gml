// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function game_init(){
	randomize();
	gpu_set_texfilter(true)
	room_goto(rm_game)
}