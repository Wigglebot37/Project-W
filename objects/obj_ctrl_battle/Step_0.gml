if(fade<1 && start_battle) fade+=0.01;

if(fade==1 && !fadetrigger) {
	/*var gm=obj_game;
	gm.stored_inst=instance;
	gm.stored_dir=stored_direction;
	gm.spawnX=spX; spawnY=spY;
	gm.spawnRoom=spRoom;
	gm.enemy=enemy;*/
	//gm.transitionbool=true;
	alarm[0]=30;
	fadetrigger=true;
}

if(keyboard_check(ord("I"))) obj_battlecam.y-=2;
else if(keyboard_check(ord("K"))) obj_battlecam.y+=2;
if(room==rm_battlescreen && !end_battle && keyboard_check_pressed(vk_backspace)) end_battle=true;

if(room==rm_battlescreen) {
	dir=-1;
	if(delay>0) delay-=delaytotal;
	else delay=0;
	if(fade2>0 && !flipstart) fade2-=0.01;
	var hinput=(input_right-input_left);
	var vinput=(input_down-input_up);
	
	if(hinput!=0 || vinput!=0) {
		if(delay==0) dir=point_direction(0,0,hinput,vinput);
		if(diagcheck) {
			var point_dir=point_direction(0,0,hinput,vinput);
			switch(point_dir) {
				case dir_upleft: dir_pick(dir_upleft); alarm[1]=-1; diagcheck=false; break;
				case dir_upright: dir_pick(dir_upright); alarm[1]=-1; diagcheck=false; break;
				case dir_downleft: dir_pick(dir_downleft); alarm[1]=-1; diagcheck=false; break;
				case dir_downright: dir_pick(dir_downright); alarm[1]=-1; diagcheck=false; break;
			}
		}
		if(delaytotal<0.1) delaytotal+=0.002;
		else if(delaytotal<0.2) delaytotal+=0.005;
		else if(delaytotal<0.3) delaytotal+=0.01;
	} else {
		delay=0;
		delaytotal=0.05;
		noinput=true;
	}
	
	#region //Inputs
	if(dir==dir_left) {
		if(noinput) {
			alarm_dir=dir;
			alarm[1]=3;
			diagcheck=true;
		} else {
			if((numselect-1) mod 16==0) numselect+=15;
			else numselect-=1;
		}
		delay=1;
		noinput=false;
	} else if(dir==dir_right) {
		if(noinput) {
			alarm_dir=dir;
			alarm[1]=3;
			diagcheck=true;
		} else {
			if((numselect) mod 16==0) numselect-=15;
			else numselect+=1;
		}
		delay=1;
		noinput=false;
	} else if(dir==dir_up) {
		if(noinput) {
			alarm_dir=dir;
			alarm[1]=3;
			diagcheck=true;
		} else {
			if(numselect<17) numselect+=(16*6);
			else numselect-=16;
		}
		delay=1;
		noinput=false;
	} else if(dir==dir_down) {
		if(noinput) {
			alarm_dir=dir;
			alarm[1]=3;
			diagcheck=true;
		} else {
			if(numselect>96) numselect-=(16*6);
			else numselect+=16;
		}
		delay=1;
		noinput=false;
	} else if(dir==dir_downleft) {
		if((numselect-1) mod 16==0) numselect+=15;
		else numselect-=1;
		if(numselect>96) numselect-=(16*6);
		else numselect+=16;
		delay=1;
		noinput=false;
	} else if(dir==dir_downright) {
		if((numselect) mod 16==0) numselect-=15;
		else numselect+=1;
		if(numselect>96) numselect-=(16*6);
		else numselect+=16;
		delay=1;
		noinput=false;
	} else if(dir==dir_upleft) {
		if((numselect-1) mod 16==0) numselect+=15;
		else numselect-=1;
		if(numselect<17) numselect+=(16*6);
		else numselect-=16;
		delay=1;
		noinput=false;
	} else if(dir==dir_upright) {
		if((numselect) mod 16==0) numselect-=15;
		else numselect+=1;
		if(numselect<17) numselect+=(16*6);
		else numselect-=16;
		delay=1;
		noinput=false;
	}
	#endregion
}