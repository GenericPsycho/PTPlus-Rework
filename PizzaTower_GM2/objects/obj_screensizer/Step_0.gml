gameframe_update();
if (global.option_unfocus_mute)
{
	if (window_has_focus())
	{
		fmod_set_parameter("focus", 1, false);
	}
	else
	{
		fmod_set_parameter("focus", 0, false);
	}
}
else
{
	fmod_set_parameter("focus", 1, false);
}

if (global.option_unfocus_pause && instance_exists(obj_pause))
{
	with (obj_pause)
	{
		if !window_has_focus() && !pause
		{
			unfocus = true;
			unfocus_pause = true;
			unfocus_draw = true;
		}
		else if window_has_focus() && unfocus_pause
		{
			unfocus = false;
			unfocus_pause = false;
			alarm[7] = 1;
			/*
			scr_pause_activate_objects();
			pause_unpause_music();
			instance_destroy(obj_option);
			instance_destroy(obj_keyconfig);
			*/
		}
	}
}