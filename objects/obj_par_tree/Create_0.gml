depth=-y;
fade=1;
//Call this once in your object before using the shader script
col1 = make_color_rgb(100,50,100);
col2 = make_color_rgb(255,255,255);
DissolveSettings(spr_treedissolve,0,col1,col2,0.2);