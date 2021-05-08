start_battle=false;
end_battle=false;

//Call this once in your object before using the shader script
col1 = make_color_rgb(0.8*255,0,0);
col2 = make_color_rgb(255,0.55*255,0);
DissolveSettings(sDissolve2_big_test,0,col1,col2,0.2);
//DissolveAmount=1+((0-1)*0.5)+sin((((current_time*0.001)+8*0)/8)*(pi*2))*((0-1)*0.5);
fighter1=noone;
enemy1=noone;
player1=noone;
player2=noone;
player3=noone;
player4=noone;

fade=0;
fade2=1;
fadetrigger=false;
delay=0;
delaytotal=0.05;
noinput=true;
dir=-1;
alarm_dir=-1;
diagcheck=false;

stored_inst=noone;
stored_dir=0;
spawnX=0; spawnY=0;
spawnRoom=noone;
enemy=noone;
numselect=1;
grid_wid=sprite_get_width(spr_grid_col);
randomize();
ran=round(random_range(1,112));
randomize();
ran2=round(random_range(1,112));
if(ran2==ran) {
	if(ran==1) ran2++;
	else ran2--;
}
fliparray=array_create(112,5);
fliptrue=array_create(112,0);
swaparray=array_create(112,0);
flipping=array_create(112,0);
flipdir=array_create(112,dir_up);
for(var i=0; i<16; i++) {
	for(var j=0; j<7; j++) {
		flip2D[i,j]=0;
	}
}
for(var i=0; i<16; i++) {
	for(var j=0; j<7; j++) {
		colarray[i,j]=0;
	}
}
for(var i=0; i<16; i++) {
	for(var j=0; j<7; j++) {
		viable[i,j]=1;
	}
}
flipstart=true;
var ix=0,iy=0,num=0;
repeat(112) {
	num++;
	flip2D[ix,iy]=num;
	ix++;
	if(ix>15) { ix=0; iy++; }
}
attack_sprite=spr_exattack;
sprite_change=true;