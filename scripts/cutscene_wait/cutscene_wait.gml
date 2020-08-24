///@function cutscene_wait(sec);
///@arg {real} Seconds

function cutscene_wait(sec) {
	timer++;
	if(timer>=sec*room_speed) {
		timer=0;
		cutscene_end_action();
	}
}