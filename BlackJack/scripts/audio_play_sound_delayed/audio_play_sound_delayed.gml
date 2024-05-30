/// @function audio_play_sound_delayed(sound_id, delay_in_steps)

function audio_play_sound_delayed(argument0, argument1){	
	sndobj = instance_create_depth(0,0,0,obj_sound_delayed)
	sndobj.sfx = argument0
	sndobj.alarm[1] = argument1+1
	return sndobj
}