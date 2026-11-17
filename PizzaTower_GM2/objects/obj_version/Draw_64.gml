draw_set_font(global.smallfont);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
var a = 0;
with (obj_mainmenu)
{
	if (instance_exists(obj_fadeout))
		a = 1 - obj_fadeout.fadealpha;
	else
		a = extrauialpha;
}
draw_text_color(SCREEN_WIDTH - 8, SCREEN_HEIGHT - 8, lang_get_value("game_version"), c_white, c_white, c_white, c_white, a);