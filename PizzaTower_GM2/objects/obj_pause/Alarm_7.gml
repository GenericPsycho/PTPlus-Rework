scr_pause_activate_objects();
pause_unpause_music();
instance_destroy(obj_option);
instance_destroy(obj_keyconfig);

var layCount = array_length(PausedLayDat);
var i = 0;

repeat (layCount)
{
	var layDat = PausedLayDat[i];
	
	layer_hspeed(layDat.Id, layDat.Hspeed);
	layer_vspeed(layDat.Id, layDat.Vspeed);
	
	var elemCount = array_length(layDat.elemDat);
	var j = 0;
	
	repeat (elemCount)
	{
		var elemDat = layDat.elemDat[j];
		var elemType = layer_get_element_type(elemDat.Id);
		
		switch (elemType)
		{
			case layerelementtype_background:
				layer_background_speed(elemDat.Id, elemDat.Speed);
				break;
			case layerelementtype_sprite:
				layer_sprite_speed(elemDat.Id, elemDat.Speed);
				break;
			default:
				trace("This element type is irrelevant");
				break;
		}
		
		j++;
	}
	
	i++;
}

PausedLayDat = [];