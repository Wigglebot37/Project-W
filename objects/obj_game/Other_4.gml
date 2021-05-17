///@description Spawn point
if(spawnRoom==-1) exit;
if(spawnRoom!=rm_battlescreen && object_exists(obj_player)) {
	obj_player.x=spawnX;
	obj_player.y=spawnY;
	if(object_exists(obj_party)) with(obj_party) {
		x=spawnX;
		y=spawnY;
	}
}