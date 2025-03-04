/// @description Room Transition
if(room==rm_battlescreen && enemy!=noone && instance_number(enemy)<1) {
	//obj_ctrl_battle.enemy=instance_create_layer(144,80,"Instances2",enemy);
}

draw_text_transformed(160*scalar,20*scalar,"pitch: "+string(glopitch),2*scalar,2*scalar,0);
draw_text_transformed(160*scalar,50*scalar,"FPS: "+string(round(fps)),2*scalar,2*scalar,0);

var c=c_black;
//Screen Transitioning
if(transitionbool) {
	//Handle transition
	if(room!=spawnRoom) {
		if(enemy==noone) {
			blackA+=0.05;
			if(blackA>=1) {
				if(room!=rm_battlescreen && instance_exists(obj_player)) {
					if(obj_player.running) runbool=true;
					else runbool=false;
					audio_play_sound(transition_sound,50,false);
					img_spd=obj_player.img_spd;
				} room_goto(spawnRoom);
			}
		} else {
			if(obj_player.flash<=0.1 && flashct<2) {
				obj_player.flash=1; flashct++;
			}
			if(trany1<game_height) trany1+=4*scalar;
			else {
				flashct=0; room_goto(spawnRoom);
			}
		}
	} else {
		if(enemy==noone) {
			if(end_battle) { 
				obj_player.invincible=true; end_battle=false; 
				if(win) {
					instance_destroy(stored_inst); win=false;
				}
			}
			obj_player.dir=pfA;
			if(runbool) obj_player.running=true;
			else obj_player.running=false;
			blackA-=0.05;
			if(blackA<=0) {
				blackA=0;
				obj_player.img_spd=img_spd;
				end_tran=true;
				transitionbool=false;
			}
		} else {
			if(trany2<game_height) trany2+=4*4;
			else {
				trany1=-4; trany2=-4;
				end_tran=true;
				transitionbool=false;
			}
		}
	}
	
	if(room!=rm_battlescreen) { //This code is repeated in the battle controller
		//blackA will act as a fader
		draw_set_alpha(blackA);
		draw_rectangle_color(0,0,game_width,game_height,c,c,c,c,false);
		draw_set_alpha(1);
		draw_rectangle_color(0,trany2,game_width,trany1,c,c,c,c,false);
	}
}

if(room==rm_start_menu && obj_start_menu.choice==0 && input_enter) {
	main_menu_transition=true; audio_play_sound(snd_start,50,false);
}

if(main_menu_transition) {
	if(room==rm_start_menu) {
		blackA+=0.05;
		if(blackA>=1) room_goto(rm_town);
	} else {
		if(blackA>=1) {
			if(file_exists("ProjectWiggle.sav")) load_game();
			else save_game();
		}
		blackA-=0.05;
		if(blackA<=0) {
			main_menu_transition=false;
		}
	}
	//blackA will act as a fader
	draw_set_alpha(blackA);
	draw_rectangle_color(0,0,game_width,game_height,c,c,c,c,false);
	draw_set_alpha(1);
}