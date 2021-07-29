if(fade>0 && obj_ctrl_battle.start_battle) fade-=0.01;
if(obj_ctrl_battle.start_battle) {
	DissolveShader(sprite_index,image_index,x,y,fade,1,1);
} else draw_self();