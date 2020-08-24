///@function cutscene_change_variable(_object,_string,_value);
///@param {index} Object
///@param {string} Var_name Name of the variable in string form.
///@param {real} Value
///@description Changes one variable into another.

function cutscene_change_variable(_object,_string,_value) {
	with(_object) {
		variable_instance_set(id,_string,_value);
	} cutscene_end_action();
}