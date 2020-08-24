///@function cutscene_room_transition(tgtrm,tgtx,tgty,pfa);
///@param {room} TargetRoom
///@param Targetx
///@param Targety
///@param {dir} PlayerFaceAfter

function cutscene_room_transition(tgtrm,tgtx,tgty,pfa) {
	with(obj_game) {
		if(!transitionbool) {
			spawnRoom=tgtrm;
			spawnX=tgtx;
			spawnY=tgty;
			pfA=pfa;
			transitionbool=true;
		}
	}
}