/// @description Insert description here
// You can write your code in this editor


if drawtext
{	
	if drawsprite
	{
		draw_self()
	}
	var _h_align_temp = draw_get_halign();
	var _v_align_temp = draw_get_valign();
	draw_set_halign(h_align)
	draw_set_valign(v_align)
	draw_text(x+xoffset,y+yoffset,text)	
	draw_set_halign(_h_align_temp)
	draw_set_valign(_v_align_temp)
}
else
{
	draw_self()
}