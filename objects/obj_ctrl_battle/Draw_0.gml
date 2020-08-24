if(start_battle) {
	DissolveShader(spr_battle_trans,image_index,obj_camera.x-view_width/2,obj_camera.y-view_height/2,fade);
}
if(room==rm_battlescreen && fade2>0) {
	DissolveShader(spr_battle_trans,image_index,0,0,fade2);
}

if(room==rm_battlescreen) {
	var ix=0,iy=0,num=0,numx=0,numy=0,ranx=0,rany=0; repeat(112) {
		num+=1;
		var battlex=32+(ix*16),battley=18+(iy*16);
		pal_swap_set(spr_grid_col,swap_val,false);
		draw_sprite(spr_battlegrid,gridflipval,battlex,battley);
		pal_swap_reset();
		if(num==numselect) {
			numx=battlex; numy=battley;
		} if(num==ran) {
			ranx=battlex; rany=battley;
		}
		ix+=1;
		if(ix==16) {
			ix=0; iy+=1;
		}
	}
	image_speed=0.08;
	draw_sprite(spr_battlesel,image_index,numx,numy);
	draw_sprite(spr_packbot,image_index,ranx,rany);
}