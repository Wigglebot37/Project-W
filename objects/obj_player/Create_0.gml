//--------Dialogue Stuff
reset_dialogue_defaults();
myPortrait=p1.myPortrait;
myPitch=p1.myPitch;
myFont=p1.myFont;
myName=p1.myName;

sp_dn=p1.sp_dn; sp_dnrn1=p1.sp_dnrn1; sp_dnrn2=p1.sp_dnrn2;
sp_up=p1.sp_up; sp_uprn1=p1.sp_uprn1; sp_uprn2=p1.sp_uprn2;
sp_rt=p1.sp_rt; sp_rtrn1=p1.sp_rtrn1; sp_rtrn2=p1.sp_rtrn2;
sp_lt=p1.sp_lt; sp_ltrn1=p1.sp_ltrn1; sp_ltrn2=p1.sp_ltrn2;
sp_dnrt=p1.sp_dnrt; sp_dnrtrn1=p1.sp_dnrtrn1; sp_dnrtrn2=p1.sp_dnrtrn2;
sp_uprt=p1.sp_uprt; sp_uprtrn1=p1.sp_uprtrn1; sp_uprtrn2=p1.sp_uprtrn2;
sp_dnlt=p1.sp_dnlt; sp_dnltrn1=p1.sp_dnltrn1; sp_dnltrn2=p1.sp_dnltrn2;
sp_uplt=p1.sp_uplt; sp_upltrn1=p1.sp_upltrn1; sp_upltrn2=p1.sp_upltrn2;

sprite_index=sp_dn;

invincible=false;
invc_ctdn=3;
ev_alpha=1;
empty=false;
running=false;
ready=false;
ready2=0;
spd=0;
walk_spd=1;
run_spd=2;
hinput=0;
vinput=0;
prepress=false;

img_spd=8;
idleadd=0;
randombool=false;
randomnum=-1;
diagfacing=false;
diagtouch=false;
diagtouchprev=false;
x1=x;
y1=y;
x2=x;
y2=y;
flash=0;

enddir=-1;
dir=dir_down;

//audio_play_sound(snd_beach,100,true);
//audio_sound_gain(snd_beach,0,0);
//maxdist=300;

tran=obj_transition;
active_textbox=noone;

zswitch=false;
zspeed=2;
zgrav=0;
z=0;
depth=-y;