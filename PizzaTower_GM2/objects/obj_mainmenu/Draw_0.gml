var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
draw_sprite_ext(sprite1122, 0, cx, cy, SCREEN_WIDTH / 64, SCREEN_HEIGHT / 64, 0, c_white, 1);
var i = 0;
if (is_holiday(holidays.halloween))
{
	i = 1;
}
draw_sprite(spr_mainmenu_bg, i, obj_screensizer.normal_size_fix_x, 0);
with (obj_menutv2)
{
	event_perform(ev_draw, 0);
}
with (obj_explosioneffect)
{
	draw_self();
}
shader_set(global.Pal_Shader);
var _x = SCREEN_WIDTH * 0.50625;
var _y = y;
//var pal = obj_player1.paletteselect;
var pal = global.game[0].palette;
var tex = global.game[0].palettetexture;
if (currentselect != -1)
{
	pal = global.game[currentselect].palette;
	tex = global.game[currentselect].palettetexture;
	if (shownoise && showswap)
	{
		pal = global.gameN[currentselect].palette_player2;
		tex = global.gameN[currentselect].palettetexture_player2;
	}
}
if (tex != noone)
{
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, tex);
}
pal_swap_set(spr_peppalette, pal, false);
if (!pep_debris)
{
	draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	if (state == states.titlescreen || (state == states.transitioncutscene && dark))
		draw_sprite_ext(spr_titlepep_forward_dark, image_index, SCREEN_WIDTH * 0.50625, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (tex != noone)
{
	pattern_reset();
}
shader_reset();
draw_set_alpha(extrauialpha);
var qx = 0;
var qy = 0;
draw_set_font(lang_get_font("bigfont"));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var options_x = SCREEN_WIDTH * 0.853125;
var options_y = 84;
lang_draw_sprite(spr_controlseggplant, 0, options_x, options_y);
scr_draw_text_arr(options_x - 88, options_y - 37, start_key, c_white);
var status_x = 183;
var status_y = 312;
var percentstate_x = 199;
var percentstate_y = 443;
var deletefile_x = 779;
var deletefile_y = 449;
lang_draw_sprite(spr_towerstatusmenu, 0, status_x, status_y);
var games = [pep_game, noise_game];
for (i = 0; i < array_length(games); i++)
{
	if (games[i] == noone)
	{
		continue;
	}
	var game = games[i];
	draw_set_font(global.combofont);
	draw_text_color(status_x + 8, status_y + 10, floor(game.percvisual), c_white, c_white, c_white, c_white, game.alpha);
	draw_sprite_ext(spr_percentstatemenu, game.perstatus_icon, percentstate_x, percentstate_y, 1, 1, 0, c_white, game.alpha);
	if (game.john)
	{
		draw_sprite_ext(spr_menu_approvedjohn, 0, percentstate_x - 80, percentstate_y, 1, 1, 0, c_white, game.alpha);
	}
	if (game.snotty)
	{
		draw_sprite_ext(spr_menu_approvedsnotty, 0, percentstate_x + 70, percentstate_y, 1, 1, 0, c_white, game.alpha);
	}
	if (game.judgement != "none")
	{
		var _i = 0;
		switch (game.judgement)
		{
			case "confused":
				_i = 0;
				break;
			case "quick":
				_i = 1;
				break;
			case "officer":
				_i = 2;
				break;
			case "yousuck":
				_i = 3;
				break;
			case "nojudgement":
				_i = 4;
				break;
			case "notbad":
				_i = 5;
				break;
			case "wow":
				_i = 6;
				break;
			case "holyshit":
				_i = 7;
				break;
		}
		var spr = spr_menu_finaljudgement;
		if (i == 1)
		{
			spr = spr_menu_finaljudgementN;
		}
		lang_draw_sprite_ext(spr, _i, percentstate_x, percentstate_y + 50, 1, 1, 0, c_white, game.alpha);
	}
}
draw_set_alpha(extrauialpha);
if (noise_unlocked && currentselect != -1)
{
	var _doise = global.gameN[currentselect].palette == 17;
	
	var icon_main = spr_mainmenu_pepicon;
	var icon_arrow = _doise ? spr_mainmenu_pepdoiseicon_arrow : spr_mainmenu_pepicon_arrow;
	var icon_spr = spr_peppalette;
	var icon_pal = global.game[currentselect].palette;
	var icon_tex = global.game[currentselect].palettetexture;
	var icon_extra = noone;
	if (shownoise)
	{
		icon_main = spr_mainmenu_noiseicon;
		icon_arrow = swap_unlocked ? spr_mainmenu_noiseswapicon_arrow : spr_mainmenu_noiseicon_arrow;
		icon_spr = spr_noisepalette;
		icon_pal = global.gameN[currentselect].palette;
		icon_tex = global.gameN[currentselect].palettetexture;
		if (showswap)
		{
			icon_main = spr_mainmenu_swapicon;
			icon_arrow = _doise ? spr_mainmenu_swapdoiseicon_arrow : spr_mainmenu_swapicon_arrow;
			icon_spr = spr_peppalette;
			icon_pal = global.gameN[currentselect].palette_player2;
			icon_tex = global.gameN[currentselect].palettetexture_player2;
			icon_extra = [spr_mainmenu_swapicon_noise, spr_noisepalette, global.gameN[currentselect].palette, global.gameN[currentselect].palettetexture];
		}
	}
	
	draw_sprite(icon_arrow, game_icon_index, status_x - 100, status_y + 195 + game_icon_y);
	shader_set(global.Pal_Shader);
	pattern_set(global.Base_Pattern_Color, icon_main, 0, image_xscale, image_yscale, icon_tex);
	pal_swap_set(icon_spr, icon_pal, false);
	draw_sprite(icon_main, game_icon_index, status_x - 100, status_y + 195 + game_icon_y);
	if icon_extra != noone
	{
		pattern_set(global.Base_Pattern_Color, icon_extra[0], 0, image_xscale, image_yscale, icon_extra[3]);
		pal_swap_set(icon_extra[1], icon_extra[2], false);
		draw_sprite(icon_extra[0], game_icon_index, status_x - 100, status_y + 195 + game_icon_y);
	}
	pattern_reset();
	shader_reset();
}
lang_draw_sprite(spr_deletefile, 0, deletefile_x, deletefile_y);
var dal = 1;
if (currentselect != -1)
{
	var _game = global.game[currentselect];
	if (shownoise)
	{
		_game = global.gameN[currentselect];
	}
	if (!_game.started)
	{
		dal = 0.5;
	}
}
scr_draw_text_arr(deletefile_x - 67, deletefile_y, taunt_key, c_white, dal);

lang_draw_sprite(spr_quitgame, 0, 0, 0);
scr_draw_text_arr(50, 100, grab_key);

draw_set_alpha(1);
