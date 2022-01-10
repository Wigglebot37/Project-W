/// @description Sets it up
#macro view view_camera[0]
globalvar view_width,view_height,display_w,display_h,scalar,ideal_width,ideal_height,fullswitch;
view_width=1920/6;
view_height=1080/6;
display_w=display_get_width();
display_h=display_get_height();
if(window_get_fullscreen()) scalar=3*.5;
else scalar=1*.5;
fullswitch=true;

window_scale=2;
ideal_width=view_width*window_scale;
ideal_height=view_height*window_scale;

zoom=1;
max_zoom=floor(display_w/ideal_width);
view_zoom=2;
view_max_zoom=8;
cam_follow=noone;

xTo=x;
yTo=y;
snapx=false;
snapy=false;
factor=20;
snapval=1;

_curx=camera_get_view_x(view);
_cury=camera_get_view_y(view);

surface_resize(application_surface,ideal_width,ideal_height);
display_set_gui_size(ideal_width,ideal_height);
window_set_size(ideal_width*zoom,ideal_height*zoom);
 
alarm[0]=1; //Center Window