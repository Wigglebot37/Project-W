///@function change_volume(_val);
///@param Volume
///@description Changes the volume.

function change_volume(_val) {
	var type=menu_option[page];
	
	switch(type) {
		case 2: audio_master_gain(_val); break;
		case 3: audio_group_set_gain(audiogroup_sounds,_val,0); break;
		case 4: audio_group_set_gain(audiogroup_music,_val,0); break;
	}
}