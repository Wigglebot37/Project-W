///@function cutscene_end_action();

function cutscene_end_action() {
	with(obj_cutscene) {
		scene++;
		if(scene>array_length(scene_info)-1) {
			cutscene_end=true;
			exit;
		}
		event_perform(ev_other,ev_user0);
	}
}