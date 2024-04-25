/// @description play indicator blink

if not playing
{
	alarm[3] = -1
	exit
}

alarm[3] = 60

if playing_visible
{
	playing_visible = false
	dbg("invis")
}
else
{
	playing_visible = true
	dbg("visible")
}