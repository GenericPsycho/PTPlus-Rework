if (!fadein)
{
	fadealpha = Approach(fadealpha, 1, 0.1);
	if (fadealpha >= 1)
	{
		fadein = true;
		start = true;
		music = false;
		alarm[0] = 180;
		if (title_music == "event:/music/secretworldtitle")
		{
			alarm[0] = 240;
		}
	}
}
else
{
	fadealpha = Approach(fadealpha, 0, 0.1);
	if (fadealpha <= 0 && !music && title_music != noone)
	{
		music = true;
		//fmod_event_one_shot(title_music);
		title_music_inst = fmod_event_create_instance(title_music);
		fmod_event_instance_play(title_music_inst);
	}
}

if !obj_debugcontroller.active
{
	scr_menu_getinput();
	if (!skip_text && key_jump && fadein && !skip_check && start)
	{
		skip_text = true;
		alarm[0] = 120;
	}
	else if (skip_text && key_jump && !skip_check && start)
	{
		skip_check = true
		alarm[0] = 1;
	}
	
	if skip_check && fmod_event_instance_is_playing(title_music_inst)
	{
		fmod_event_instance_stop(title_music_inst, true)
	}
}
