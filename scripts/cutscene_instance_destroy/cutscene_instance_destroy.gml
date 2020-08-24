///@function cutscene_instance_destroy(obj_id);
///@param {real} Object_id

function cutscene_instance_destroy(obj_id) {
	with(obj_id) instance_destroy();
	cutscene_end_action();
}