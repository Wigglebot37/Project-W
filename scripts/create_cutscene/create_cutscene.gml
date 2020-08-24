///@function create_cutscene(_scene_info);
///@param Scene_Info

function create_cutscene(_scene_info) {
	var inst=instance_create_layer(0,0,"Objects",obj_cutscene);
	with(inst) {
		scene_info=_scene_info;
		event_perform(ev_other,ev_user0);
	}
}