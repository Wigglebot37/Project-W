/// @description Text Box Trigger/Interactions
if(input_interact_pres && active_textbox==noone && !pause && !zswitch) {
	switch(dir) {
		case dir_up: x1=x-4; y1=y-5; x2=x+4; y2=y-5; diagfacing=false; break;
		case dir_down: x1=x-4; y1=y+2; x2=x+4; y2=y+2; diagfacing=false; break;
		case dir_right: x1=x+9; y1=y; x2=x+9; y2=y-3; diagfacing=false; break;
		case dir_left: x1=x-9; y1=y; x2=x-9; y2=y-3; diagfacing=false; break;
		default: diagfacing=true;
	}
	if(!diagfacing) {
		var textinst=collision_rectangle(x1,y1,x2,y2,obj_par_text,false,false);
		var iteminst=collision_rectangle(x1,y1,x2,y2,obj_item_par,false,false);

		if(textinst!=noone) {
			with(textinst) {
				event_user(0);
				var tbox=create_dialogue(myText, mySpeaker, myEffects, myTextSpeed, myTypes, myNextLine, myScripts, myTextCol);
			}
			active_textbox=tbox;
		}
		if(iteminst!=noone) {
			var obj="n/a";
			switch(iteminst.itemhold) {
				case item.cookie: obj="cookie"; break;
				case item.lollipop: obj="lollipop"; break;
				case item.pie: obj="pumpkin pie"; break;
				default: empty=true;
			}
			var yy=0;
			if(!iteminst.opened) {
				with(obj_inventory) {
					repeat(inv_slots) {
						if(ds_inventory[# 0,yy]==0) {
							ds_inventory[# 0,yy]=iteminst.itemhold; 
							iteminst.opened=true; break;
						} yy++;
					}
				}
				if(!iteminst.opened) active_textbox=create_textevent("Everett's inventory is full.",noone);
				else active_textbox=create_textevent("Everett picked up a "+obj+"!",noone);
			} else active_textbox=create_textevent("There was nothing left.",noone);
		}
	}
}

if(room!=rm_battlescreen && !obj_ctrl_battle.start_battle) {
	if((hinput!=0 || vinput!=0 || running) && followers) {
	    for(var c=60; c>0; c--) {
	        prevx[c]=prevx[c-1];
	        prevy[c]=prevy[c-1];
	        prevd[c]=prevd[c-1];
	    }
	    prevx[0]=x;
	    prevy[0]=y;
	    prevd[0]=direction;
	}
	//Party members' direction handle and position update
	with(obj_party) {
	    x=other.prevx[player_index*20];
	    y=other.prevy[player_index*20];
	    dir=other.prevd[player_index*20];
	}
}