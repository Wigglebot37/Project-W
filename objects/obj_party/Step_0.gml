/// @description Spritework
running=obj_player.running;
ready2=obj_player.ready2;
ready=obj_player.ready;
#region //Sprite Changes
if(running) sprite_index=spr_trplayer;
else {
	image_speed=1; if(image_index>=4) image_index=0;
}
if(!running) {
	switch(dir) {
		case dir_up:
			if(ready2==1) sprite_index=sp_uprn2;
			else if(ready) sprite_index=sp_uprn1;
			else sprite_index=sp_up;
			break;
		case dir_upright:
			if(ready2==1) sprite_index=sp_uprtrn2;
			else if(ready) sprite_index=sp_uprtrn1;
			else sprite_index=sp_uprt;
			break;
		case dir_right:
			if(ready2==1) sprite_index=sp_rtrn2;
			else if(ready) sprite_index=sp_rtrn1;
			else sprite_index=sp_rt;
			break;
		case dir_downright:
			if(ready2==1) sprite_index=sp_dnrtrn2;
			else if(ready) sprite_index=sp_dnrtrn1;
			else sprite_index=sp_dnrt;
			break;
		case dir_down:
			if(ready2==1) sprite_index=sp_dnrn2;
			else if(ready) sprite_index=sp_dnrn1;
			else sprite_index=sp_dn;
			break;
		case dir_downleft:
			if(ready2==1) sprite_index=sp_dnltrn2;
			else if(ready) sprite_index=sp_dnltrn1;
			else sprite_index=sp_dnlt;
			break;
		case dir_left:
			if(ready2==1) sprite_index=sp_ltrn2;
			else if(ready) sprite_index=sp_ltrn1;
			else sprite_index=sp_lt;
			break;
		case dir_upleft:
			if(ready2==1) sprite_index=sp_upltrn2;
			else if(ready) sprite_index=sp_upltrn1;
			else sprite_index=sp_uplt;
			break;
	}
}
#endregion

depth=-y;
direction=dir;
if(!running && obj_player.speed==0 && !ready) image_index=1;