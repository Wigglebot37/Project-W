var curx=camera_get_view_x(view);
var cury=camera_get_view_y(view);
if(start_battle) {
	DissolveShader(spr_battle_trans,image_index,curx,cury,fade,1,1);
}

if(room==rm_battlescreen && fade2>0) {
	DissolveShader(spr_battle_trans,image_index,curx,cury,fade2,1,1);
}

if(room==rm_battlescreen) {
	if(flipstart && fliptrue[0]==0) fliptrue[0]=1;
	if(keyboard_check_pressed(vk_shift) && fliparray[numselect-1]==0 && !flipstart) {
		fliptrue[numselect-1]=1; flipping[numselect-1]=1;
	}
	var spr=attack_sprite, xo=sprite_get_xoffset(spr),yo=sprite_get_yoffset(spr),col=0,
		wid=sprite_get_width(spr),hgt=sprite_get_height(spr),xx=0,yy=0,maxindex=4;
	var ix=0,iy=0,num=0,numx=0,numy=0,ranx=0,rany=0,flipspd=0.5;
	if(sprite_change) {
		object_set_sprite(obj_attrange,attack_sprite);
		var inst=instance_create_depth(xo,yo,0,obj_attrange);
		repeat(wid*hgt) {
			col=collision_rectangle(xx,yy,xx,yy,obj_attrange,true,true);
			if(col==-4) col=1;
			else col=0;
			colarray[xx,yy]=col;
			xx++;
			if(xx>wid-1) { xx=0; yy++; }
		} instance_destroy(inst);
	}
	
	if(keyboard_check_pressed(vk_control)) {
		sprite_change=true; 
		if(spr==spr_exattack) attack_sprite=spr_exattack2;
		else if(spr==spr_exattack2) attack_sprite=spr_exattack;
	}
	repeat(112) {
		num++;
		if(!flipstart && num==numselect && keyboard_check_pressed(vk_shift) && fliparray[numselect-1]==0) {
			var xx=0,yy=0,rmax=wid-xo-1+ix,dmax=hgt-yo-1+iy;
			repeat(wid*hgt) {
				var xval=xx+ix-xo, yval=yy+iy-yo;
				if(xval>=0 && xval<=rmax && yval>=0 && yval<=dmax)
					viable[xval,yval]=colarray[xx,yy];
				xx++;
				if(xx>wid-1) { xx=0; yy++; }
			}
		}
		if(!flipstart) {
			if(flipping[num-1]==0 && viable[ix,iy]==0) {
				if(ix!=0 && fliparray[flip2D[ix-1,iy]-1]>1 && fliptrue[flip2D[ix-1,iy]-1]==1) {
					fliptrue[num-1]=1; flipping[num-1]=1; flipdir[num-1]=dir_left;
				} if(ix!=15 && fliparray[flip2D[ix+1,iy]-1]>1 && fliptrue[flip2D[ix+1,iy]-1]==1) {
					fliptrue[num-1]=1; flipping[num-1]=1; flipdir[num-1]=dir_right;
				} if(iy!=0 && fliparray[flip2D[ix,iy-1]-1]>1 && fliptrue[flip2D[ix,iy-1]-1]==1) {
					fliptrue[num-1]=1; flipping[num-1]=1; flipdir[num-1]=dir_up;
				} if(iy!=6 && fliparray[flip2D[ix,iy+1]-1]>1 && fliptrue[flip2D[ix,iy+1]-1]==1) {
					fliptrue[num-1]=1; flipping[num-1]=1; flipdir[num-1]=dir_down;
				}
			}
			if(fliptrue[num-1]==1 && flipping[num-1]==1) {
				if(fliparray[num-1]<maxindex) fliparray[num-1]+=flipspd;
				else {
					if(flipdir[num-1]==dir_left) flipdir[num-1]=dir_right;
					else if(flipdir[num-1]==dir_right) flipdir[num-1]=dir_left;
					else if(flipdir[num-1]==dir_up) flipdir[num-1]=dir_down;
					else if(flipdir[num-1]==dir_down) flipdir[num-1]=dir_up;
					fliptrue[num-1]=0; 
					if(grid_wid-1>swaparray[num-1]) swaparray[num-1]++;
					else swaparray[num-1]=0;
				}
			}
		}
		if(fliptrue[num-1]==0 && num!=1 && fliparray[num-1]>0 && flipstart) {
			if(ix!=0 && fliparray[flip2D[ix-1,iy]-1]<=maxindex && iy!=0 && fliparray[flip2D[ix,iy-1]-1]<=maxindex)
				fliparray[num-1]-=flipspd;
			else if((ix!=0 && fliparray[flip2D[ix-1,iy]-1]<=maxindex) || (iy!=0 && fliparray[flip2D[ix,iy-1]-1]<=maxindex)) 
				fliparray[num-1]-=flipspd;
		} else if(flipstart && num==1 && fliparray[num-1]>0) fliparray[num-1]-=flipspd;
		if(fliptrue[num-1]==0 && flipping[num-1]==1 && !flipstart) {
			if(fliparray[num-1]>0) fliparray[num-1]-=flipspd;
			else { flipping[num-1]=0; viable[ix,iy]=1; }
		}
		#region // Calculates positions and draws
		var battlex=40+(ix*16),battley=60+(iy*16);
		pal_swap_set(spr_grid_col,swaparray[num-1],false);
		draw_sprite_ext(spr_battlegrid,fliparray[num-1],battlex,battley,1,1,flipdir[num-1]+90,c_white,1)
		pal_swap_reset();
		
		if(num==numselect) { numx=battlex; numy=battley; }
		if(num==ran) { ranx=battlex; rany=battley; }
		//if(viable[ix,iy]==0) draw_sprite(spr_battlesel,image_index,battlex,battley);
		ix++;
		if(ix>15) { ix=0; iy++; }
		if(flipstart && num==112 && fliparray[111]==flipspd && fliptrue[111]==0) {
			flipstart=false; fliptrue[0]=0;
		}
		#endregion
	}
	image_speed=0.08;
	draw_sprite(spr_battlesel,image_index,numx,numy);
	draw_sprite(spr_packbot,image_index,ranx,rany);
	
	// Helps measure pixels
	//var yii=0;
	//repeat(15) { draw_sprite(spr_battlegrid,0,8,yii-8); yii+=16; }
}