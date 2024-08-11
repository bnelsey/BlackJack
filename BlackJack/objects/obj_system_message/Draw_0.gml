/// @description Insert description here
// You can write your code in this editor


draw_set_color(c_white)
draw_set_alpha(image_alpha)
draw_set_halign(fa_center)

var _font_temp = draw_get_font();
draw_set_font(fnt_table_smaller)
draw_text(x,y,drawtext)
draw_set_font(_font_temp)
draw_set_alpha(1)