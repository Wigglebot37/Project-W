///@function cutscene_instance_create(xx,yy,lay_id,obj);
///@arg x
///@arg y
///@arg {index} Layer_id
///@arg {index} Object

function cutscene_instance_create(xx,yy,lay_id,obj) {
	var cut_inst=instance_create_layer(xx,yy,lay_id,obj);
	cutscene_end_action();
	return cut_inst;
}