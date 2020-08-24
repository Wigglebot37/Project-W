///@function change_window_mode();
///@description change_window_mode();

function change_window_mode() {
	window_set_fullscreen(!window_get_fullscreen());
	resize_set=true;
}