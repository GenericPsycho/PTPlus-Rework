//draw_self();

shader_set(global.Pal_Shader);
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.game[0].palettetexture);
pal_swap_set(spr_peppalette, global.game[0].palette, false);
draw_self();
draw_sprite_ext(spr_mainmenu_jumpscare_shadow, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
pattern_reset();
shader_reset();