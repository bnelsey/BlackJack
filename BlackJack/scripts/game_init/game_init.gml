// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function game_init(){
	global.volume = 1
	
	if file_exists("savegame.ini") {
	    ini_open("savegame.ini");
	    global.volume = ini_read_real("Settings", "Volume", 1);
		global.volume = floor(global.volume)
		//audio_master_gain(global.volume)
	    ini_close();
		
	}
	randomize();
	gpu_set_texfilter(true)
	room_goto(rm_game)
}