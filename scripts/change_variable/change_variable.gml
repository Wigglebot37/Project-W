///@function change_variable(_object,_string,_value);
///@param {index} Object
///@param {string} Var_name Name of the variable in string form.
///@param {real} Value
///@description Changes one variable into another.

function change_variable(_object,_string,_value) {
	var tempval=_value;
	if(_object!=noone) {
		with(_object) {
			variable_instance_set(id,_string,_value);
		}
	} else variable_global_set(_string,_value);
	if(_string=="pl_count" && _object=noone) with(obj_player) { event_user(1); old_count=tempval; }
}