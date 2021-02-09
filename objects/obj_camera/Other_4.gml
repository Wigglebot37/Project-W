/// @description Turn view on
view_enabled=true;
view_visible[0]=true;

// Temporary
if(room!=rm_battlescreen) {
	if(instance_exists(obj_player)) {
		cam_follow=obj_player;
		xTo=obj_player.x;
		yTo=obj_player.y-16;
		camera_set_view_pos(view,xTo,yTo);
	} else cam_follow=noone;
} else {
	cam_follow=obj_battlecam;
	xTo=obj_battlecam.x;
	yTo=obj_battlecam.y-16;
	camera_set_view_pos(view,xTo,yTo);
}