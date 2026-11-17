function scr_isdoise(_id = obj_player)
{
	var n = get_noise_palette_info()
	return !_id.ispeppino && n.paletteselect == 17;
}