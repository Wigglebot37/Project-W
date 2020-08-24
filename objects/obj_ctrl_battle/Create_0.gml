start_battle=false;

//Call this once in your object before using the shader script
col1 = make_color_rgb(0.8*255,0,0);
col2 = make_color_rgb(255,0.55*255,0);
DissolveSettings(sDissolve2_big_test,0,col1,col2,0.2);

//DissolveAmount=1+((0-1)*0.5)+sin((((current_time*0.001)+8*0)/8)*(pi*2))*((0-1)*0.5);

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
gridflipval=0;
gridflip=false;
swap_val=0;
grid_wid=sprite_get_width(spr_grid_col);
randomize();
ran=round(random_range(1,112));