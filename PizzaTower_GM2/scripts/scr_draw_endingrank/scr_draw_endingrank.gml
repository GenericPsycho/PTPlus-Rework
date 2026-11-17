function scr_draw_endingrank()
{
	if (sprite_index == spr_rank_wow)
	{
		lang_draw_sprite(spr_rank_wow_text, image_index, x, y);
	}
	
	//draw_self();
	shader_set(global.Pal_Shader);
	var _palinfo = global.swapmode || !obj_player1.ispeppino ? get_noise_palette_info() : get_pep_palette_info();
	var _palspr = global.swapmode || !obj_player1.ispeppino ? spr_noisepalette : spr_peppalette;
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, _palinfo.patterntexture);
	pal_swap_set(_palspr, _palinfo.paletteselect, false);
	draw_self();
	pattern_reset();
	shader_reset();
	
	var spr = noone;
	switch (sprite_index)
	{
		case spr_rank_confused:
			spr = spr_rank_confused_text;
			break;
		case spr_rank_holyshit:
			spr = spr_rank_holyshit_text;
			break;
		case spr_rank_nojudgement:
			spr = spr_rank_nojudgement_text;
			break;
		case spr_rank_notbad:
			spr = spr_rank_notbad_text;
			break;
		case spr_rank_officer:
			spr = spr_rank_officer_text;
			break;
		case spr_rank_quick:
			spr = spr_rank_quick_text;
			break;
		case spr_rank_wow:
			spr = spr_rank_wow_text;
			break;
		case spr_rank_yousuck:
			spr = spr_rank_yousuck_text;
			break;
		case spr_rankN1:
			spr = spr_rankN1_text;
			break;
		case spr_rankN2:
			spr = spr_rankN2_text;
			break;
		case spr_rankN3:
			spr = spr_rankN3_text;
			break;
		case spr_rankN4:
			spr = spr_rankN4_text;
			break;
		case spr_rankN5:
			spr = spr_rankN5_text;
			break;
		case spr_rankN_holyshit:
			spr = spr_rankN_holyshit_text;
			break;
		case spr_rankN_quick:
			spr = spr_rankN_quick_text;
			break;
		case spr_rankN_wow:
			spr = spr_rankN_wow_text;
			break;
	}
	if (spr != noone && (sprite_index != spr_rank_wow || lang_get_value("wow_front")))
	{
		lang_draw_sprite(spr, image_index, x, y);
	}
}
