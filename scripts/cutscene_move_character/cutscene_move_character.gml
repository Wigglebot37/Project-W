///@function cutscene_move_character(obj,xi,yi,relative,new_spd);
///@param Obj_Inst
///@param x
///@param y
///@param Relative
///@param Speed

function cutscene_move_character(obj,xi,yi,relative,new_spd) {
	if(x_dest==-1) {
		if(!relative) {
			x_dest=xi;
			y_dest=yi;
		} else {
			x_dest=obj.x+xi;
			y_dest=obj.y+yi;
		}
	}

	/*
	For Reference:

	dir_up=90;
	dir_upright=45;
	dir_right=0;
	dir_downright=315;
	dir_down=270;
	dir_downleft=225;
	dir_left=180;
	dir_upleft=135;
	*/

	xi=x_dest; yi=y_dest;

	with(obj) {
		if(point_distance(x,y,xi,yi)>new_spd) {
			if(x<xi+1 && x>xi-1) x=xi;
			if(y<yi+1 && y>yi-1) y=yi;
			var new_dir=point_direction(x,y,xi,yi);
			spd=new_spd;
		
			if(new_dir==90) dir=dir_up;
			else if(new_dir==0) dir=dir_right;
			else if(new_dir==270) dir=dir_down;
			else if(new_dir==180) dir=dir_left;
			else if(new_dir>90 && new_dir<180) dir=dir_upleft;
			else if(new_dir<90 && new_dir>0) dir=dir_upright;
			else if(new_dir<360 && new_dir>270) dir=dir_downright;
			else if(new_dir>180 && new_dir<270) dir=dir_downleft;
		} else {
			x=xi;
			y=yi;
			spd=0;
			with(other) {
				x_dest=-1;
				y_dest=-1;
				cutscene_end_action();
			}
		}
	}
}