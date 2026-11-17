if (obj_player1.ispeppino && !global.swapmode)
{
	draw_sprite(spr_mrmooney_house, 0, x, y);
	draw_self();
}
else
{
	var _palinfo = get_noise_palette_info();
	shader_set(global.Pal_Shader);
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, _palinfo.patterntexture);
	pal_swap_set(spr_noisettepalette, _palinfo.paletteselect, false);
	draw_self();
	pattern_reset();
	shader_reset();
}
if (showmoney)
{
	draw_set_font(global.moneyfont);
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	var cx = x;
	var cy = (y - 130) + money_y;
	draw_sprite(spr_stickmoney, 0, cx, cy);
	draw_text(cx + 20, cy, concat(maxscore));
}
