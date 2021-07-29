if(room==rm_battlescreen) {
	if(p1!=noone) player1=instance_create_layer(640/4,50,"Characters",obj_player);
	playerinst=player1;
	playerinst.dir=dir_up;
	switch(pl_count) {
		case 4: bot4=instance_create_layer(0,0,"Characters",obj_packbot);
		case 3: bot3=instance_create_layer(0,0,"Characters",obj_packbot);
		case 2: bot2=instance_create_layer(0,0,"Characters",obj_packbot);
		case 1: bot1=instance_create_layer(0,0,"Characters",obj_packbot);
		break;
	}
	switch(pl_count) {
		case 1: 
			posx1=7;
		break;
		case 2: 
			posx1=4; posx2=11;
		break;
		case 3: 
			posx1=3; posx2=7; posx3=12;
		break;
		case 4: 
			posx1=2; posx2=6; posx3=9; posx4=13;
		break;
	}
	enemy1=instance_create_layer(0,0,"Characters",obj_enemy1);
	background1=instance_create_layer(0,0,"Instances",obj_battle_bckg);
	with(background1) {
		back=spr_battle_back1; effect=3; image_speed=0.05;
	} background2=instance_create_layer(0,0,"Instances",obj_battle_bckg);
	with(background2) {
		back=spr_back_rain; effect=1; speedy=0.8;
	}
	#region //List of things that can be affected and their defaults
	/*
	back = spr_back_dmnd;   // Sprite index
	alpha = 1;              // Sprite transparency
	phaseoffset = 0;        // Increased by phaserate every step to create wave movement 
	phaserate = 1;          // Speed of wave movement
	frequency = 50;         // Density of waves
	amplitude = 5;          // Intensity of waves
	offsetx = 0;            // Horizontal offset
	offsety = 0;            // Vertical offset
	speedx = 0;             // Horizontal speed
	speedy = 0;             // Vertical speed
	tr_offsetx = 0;         // Increased by speedx every step to create translation
	tr_offsety = 0;         // Increased by speedy every step to create translation
	sourcex = 0;
	sourcey = 0;
	effect = 0;             // 0: Sine, 1: VerComp, 2: HorComp (incomplete) 3: Sine+VerComp
	scanline = 0;           // Scanline effect. 0: None, 1: Draw even lines, 2: Draw odd lines
	image_speed = 0.1;      // Animation speed
	*/
	#endregion
}