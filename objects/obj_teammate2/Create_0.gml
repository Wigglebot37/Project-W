//--------Dialogue Stuff
reset_dialogue_defaults();
myPortrait			= spr_evrtdn;
myPitch				= 1;
myFont				= FONT_NORM;
myName				= "Jimmy";

// Player Additions
sp_dn=spr_evdn2; sp_dnrn1=spr_evrtdnrdy; sp_dnrn2=spr_evrtdnrdy2;
sp_up=spr_evrtup; sp_uprn1=spr_evrtuprdy; sp_uprn2=spr_evrtuprdy2;
sp_rt=spr_evrtrt; sp_rtrn1=spr_evrtrtrdy; sp_rtrn2=spr_evrtrtrdy2;
sp_lt=spr_evrtlt; sp_ltrn1=spr_evrtltrdy; sp_ltrn2=spr_evrtltrdy2;
sp_dnrt=spr_evrtdnrt; sp_dnrtrn1=spr_evrtdnrtrdy; sp_dnrtrn2=spr_evrtdnrtrdy2;
sp_uprt=spr_evrtuprt; sp_uprtrn1=spr_evrtuprtrdy; sp_uprtrn2=spr_evrtuprtrdy2;
sp_dnlt=spr_evrtdnlt; sp_dnltrn1=spr_evrtdnltrdy; sp_dnltrn2=spr_evrtdnltrdy2;
sp_uplt=spr_evrtuplt; sp_upltrn1=spr_evrtupltrdy; sp_upltrn2=spr_evrtupltrdy2;
// (New Code) ^^

fighter=obj_packbot;
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
flash=0;

enddir=-1;

active_textbox=noone;