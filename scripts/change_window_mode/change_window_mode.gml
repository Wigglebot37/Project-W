///@function change_window_mode();
///@description change_window_mode();

function change_window_mode() {
	if(fullswitch) {
		var win=window_get_fullscreen();
		window_set_fullscreen(!win);
		if(!win) scalar=3;
		else scalar=1;
		obj_camera.alarm[1]=2;
		fullswitch=false;
	}
}