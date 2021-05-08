///Make allies that follow you around
if(room!=rm_battlescreen) {
	for(var c=0; c<=5*14; c++) {
	    prevx[c]=x;
	    prevy[c]=y;
	    prevd[c]=direction;
	}
}

if(!instance_exists(obj_party)) {
	for(c=1; c<pl_count; c++){
		var partyCharacter=instance_create_layer(x,y,"Characters",obj_party);
		partyCharacter.player_index=c;
		with(partyCharacter) {
			x=obj_player.prevx[0]; y=obj_player.prevy[0];
			var i=noone;
			switch(c) {
				case 1: i=p2; break;
				case 2: i=p3; break;
				case 3: i=p4; break;
			}
			myPortrait=i.myPortrait;
			myPitch=i.myPitch;
			myFont=i.myFont;
			myName=i.myName;

			sp_dn=i.sp_dn; sp_dnrn1=i.sp_dnrn1; sp_dnrn2=i.sp_dnrn2;
			sp_up=i.sp_up; sp_uprn1=i.sp_uprn1; sp_uprn2=i.sp_uprn2;
			sp_rt=i.sp_rt; sp_rtrn1=i.sp_rtrn1; sp_rtrn2=i.sp_rtrn2;
			sp_lt=i.sp_lt; sp_ltrn1=i.sp_ltrn1; sp_ltrn2=i.sp_ltrn2;
			sp_dnrt=i.sp_dnrt; sp_dnrtrn1=i.sp_dnrtrn1; sp_dnrtrn2=i.sp_dnrtrn2;
			sp_uprt=i.sp_uprt; sp_uprtrn1=i.sp_uprtrn1; sp_uprtrn2=i.sp_uprtrn2;
			sp_dnlt=i.sp_dnlt; sp_dnltrn1=i.sp_dnltrn1; sp_dnltrn2=i.sp_dnltrn2;
			sp_uplt=i.sp_uplt; sp_upltrn1=i.sp_upltrn1; sp_upltrn2=i.sp_upltrn2;

			sprite_index=sp_dn;

			fighter=i.fighter;
		}
	}
}