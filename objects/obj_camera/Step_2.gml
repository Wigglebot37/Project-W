/// @description Following and Clamping
var zoomspeed=0.2;
view_zoom+=keyboard_check_pressed(ord("W"))*zoomspeed;
view_zoom-=keyboard_check_pressed(ord("S"))*zoomspeed;
view_zoom=clamp(view_zoom,1,view_max_zoom);

camera_set_view_size(view,ideal_width/view_zoom,ideal_height/view_zoom);

if(instance_exists(cam_follow)) {
	//Allows for gradual camera movement if needed
	if(!snapx && (xTo-_curx)<=1 && (xTo-_curx)>=-1) {
		_curx=xTo; snapx=true;
	} else if(snapx && (xTo-_curx)>1.5 && (xTo-_curx)<-1.5) snapx=false;

	if(!snapy && (yTo-_cury)<=1 && (yTo-_cury)>=-1) {
		_cury=yTo; snapy=true;
	} else if(snapy && (yTo-_cury)>1.5 && (yTo-_cury)<-1.5) snapy=false;

	if(!pause) {
		_curx+=(xTo-_curx)/factor;
		_cury+=(yTo-_cury)/factor;
	}

	if(cam_follow!=noone) {
		xTo=floor(cam_follow.x);
		yTo=floor(cam_follow.y-16);
	}
	
	var _x=clamp(_curx-view_width/2,0,room_width-view_width);
	var _y=clamp(_cury-view_height/2,0,room_height-view_height);
	
	camera_set_view_pos(view,_x,_y);
}