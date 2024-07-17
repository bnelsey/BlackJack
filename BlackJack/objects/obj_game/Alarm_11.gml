/// @description play music



// if no playlist enabled, do nothing
if global.playlist_dance == false and global.playlist_island == false and global.playlist_jazz == false and global.playlist_latin == false
{
	dbg("no playlist/s enabled")
	
	// stop any already playing bgm
	audio_group_stop_all(group_bgm)
	
	alarm[11] = -1
	exit	
}

alarm[11] = room_speed / 10

if array_length(global.playlist) < 1 // first play since start or reset playlists
{
	// stop any already playing bgm
	audio_group_stop_all(group_bgm)

	if global.playlist_dance
		global.playlist = array_concat(global.playlist, list_dance)
	if global.playlist_island
		global.playlist = array_concat(global.playlist, list_island)
	if global.playlist_jazz
		global.playlist = array_concat(global.playlist, list_jazz)
	if global.playlist_latin
		global.playlist = array_concat(global.playlist, list_latin)
		
		
	// sanity check in-case playlists selected have zero songs
	if array_length(global.playlist) < 1 
	{
		dbg("playlist/s selected are empty, do nothing")
		
		// stop any already playing bgm
		audio_group_stop_all(group_bgm)
		
		alarm[11] = -1
		exit
	}
		
	global.playlist = array_shuffle(global.playlist)
	
	global.current_music = 0
	audio_play_sound(global.playlist[global.current_music], 1, false)
	dbg("now playing", audio_get_name(global.playlist[global.current_music]))
}
else // check if time to play next track
{
	if not audio_is_playing(global.playlist[global.current_music])
	{
		global.current_music += 1
		if global.current_music >= array_length(global.playlist)
			global.current_music = 0
		
		audio_play_sound(global.playlist[global.current_music], 1, false)
		dbg("now playing", audio_get_name(global.playlist[global.current_music]))
	}
}
