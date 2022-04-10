/// @description Following and Clamping
var zoomspeed=0.2;
view_zoom+=keyboard_check_pressed(ord("W"))*zoomspeed;
view_zoom-=keyboard_check_pressed(ord("S"))*zoomspeed;
view_zoom=clamp(view_zoom,1,view_max_zoom);

camera_set_view_size(view,ideal_width/view_zoom,ideal_height/view_zoom);

if(instance_exists(cam_follow)) {
	/*/Allows for gradual camera movement if needed
	if(!snapx && (xTo-_curx)<=snapval && (xTo-_curx)>=-snapval) {
		_curx=xTo; snapx=true;
	} else if(snapx && ((xTo-_curx)>snapval || (xTo-_curx)<-snapval)) snapx=false;

	if(!snapy && (yTo-_cury)<=snapval && (yTo-_cury)>=-snapval) {
		_cury=yTo; snapy=true;
	} else if(snapy && ((yTo-_cury)>snapval || (yTo-_cury)<-snapval)) snapy=false;

	if(!pause) {
		_curx+=(xTo-_curx)/factor;
		_cury+=(yTo-_cury)/factor;
	}

	if(cam_follow!=noone) {
		xTo=floor(cam_follow.x);
		yTo=floor(cam_follow.y-16);
	}*/
	factor=1;
	if(cam_follow==obj_player) {
		factor=cam_follow.spd;
		if(cam_follow.spd==0) factor=1;
	}
	if(cam_follow!=noone) {
		//_curx=cam_follow.x;
		//_cury=cam_follow.y;
		_curx=lerp(_curx,round(cam_follow.x),0.08/factor);
		_cury=lerp(_cury,round(cam_follow.y-16),0.08/factor);
		if(abs(_curx-cam_follow.x)<1) _curx=cam_follow.x;
		if(abs(_cury-cam_follow.y-16)<1) _cury=cam_follow.y;
	}
	
	var _x=clamp(_curx-ideal_width/view_zoom/2,0,room_width-view_width);
	var _y=clamp(_cury-ideal_height/view_zoom/2,0,room_height-view_height);
	show_debug_message(_x);
	
	camera_set_view_pos(view,_x,_y);
}