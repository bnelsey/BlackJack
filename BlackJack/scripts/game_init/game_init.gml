// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function game_init(){
	global.volume = 1
	global.decks = 5
	global.musicvolume = 1
	global.buy_in = 5000
	global.table_color = 0
	
	if file_exists("savegame.ini") {
	    ini_open("savegame.ini");
	    global.volume = ini_read_real("Settings", "Volume", 1);
		global.volume = floor(global.volume)
		
	    global.musicvolume = ini_read_real("Settings", "MusicVolume", 1);
		global.musicvolume = floor(global.musicvolume)
				
	    global.decks = ini_read_real("Settings", "Decks", 5);		
		global.decks = floor(global.decks)		
		
	    global.buy_in = ini_read_real("Settings", "Buy-in", 5000);		
		global.buy_in = floor(global.buy_in)		
		
	    global.table_color = ini_read_real("Settings", "Table-color", 0);		
		global.table_color = floor(global.table_color)	
		
	    ini_close();
	}
	
	
		
		
	randomize();
	gpu_set_texfilter(true)
	room_goto(rm_game)
}