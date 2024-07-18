// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function game_init(){
	global.volume = 1
	global.sfx = 1
	global.musicvolume = 1
	global.decks = 5
	global.buy_in = 5000
	global.table_color = 0
	
	global.playlist_dance = true
	global.playlist_island = true
	global.playlist_jazz = true
	global.playlist_latin = true
	global.playlist = []
	global.current_music = 0
	
	audio_group_load(group_bgm);
	

	if file_exists("savegame.ini") {
	    ini_open("savegame.ini");
	    global.volume = ini_read_real("Settings", "Volume", 1);
		global.volume = floor(global.volume)
		
	    global.sfx = ini_read_real("Settings", "Sfx", 1);
		global.sfx = floor(global.sfx)
		
	    global.musicvolume = ini_read_real("Settings", "MusicVolume", 1);
		global.musicvolume = floor(global.musicvolume)
		
	    global.playlist_dance = ini_read_real("Settings", "PlaylistDance", 1);
		global.playlist_dance = floor(global.playlist_dance)
	    global.playlist_island = ini_read_real("Settings", "PlaylistIsland", 1);
		global.playlist_island = floor(global.playlist_island)
	    global.playlist_jazz = ini_read_real("Settings", "PlaylistJazz", 1);
		global.playlist_jazz = floor(global.playlist_jazz)
	    global.playlist_latin = ini_read_real("Settings", "PlaylistLatin", 1);
		global.playlist_latin = floor(global.playlist_latin)
				
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