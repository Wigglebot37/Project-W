///@function dir_pick(_dir);
///@param {dir} Direction
///@description Picks the direction.

function dir_pick(_dir) {
	switch(_dir) {
		case dir_left:
			if((numselect-1) mod 16==0) numselect+=15;
			else numselect-=1;
			break;
		case dir_right:
			if((numselect) mod 16==0) numselect-=15;
			else numselect+=1;
			break;
		case dir_up:
			if(numselect<17) numselect+=(16*6);
			else numselect-=16;
			break;
		case dir_down:
			if(numselect>96) numselect-=(16*6);
			else numselect+=16;
			break;
		case dir_downleft:
			if((numselect-1) mod 16==0) numselect+=15;
			else numselect-=1;
			if(numselect>96) numselect-=(16*6);
			else numselect+=16;
			break;
		case dir_downright:
			if((numselect) mod 16==0) numselect-=15;
			else numselect+=1;
			if(numselect>96) numselect-=(16*6);
			else numselect+=16;
			break;
		case dir_upleft:
			if((numselect-1) mod 16==0) numselect+=15;
			else numselect-=1;
			if(numselect<17) numselect+=(16*6);
			else numselect-=16;
			break;
		case dir_upright:
			if((numselect) mod 16==0) numselect-=15;
			else numselect+=1;
			if(numselect<17) numselect+=(16*6);
			else numselect-=16;
			break;
	}
}
