///@function save_game();

function save_game() {
	var _saveData=array_create(0);
	
	with(obj_player) {
		var _saveEntity={
			obj : object_get_name(object_index),
			x : x,
			y : y,
		}
		array_push(_saveData,_saveEntity);
	}
	
	// Takes array of structs, turns into string
	var _string=json_stringify(_saveData);
	var _buffer=buffer_create(string_byte_length(_string)+1,buffer_fixed,1);
	
	buffer_write(_buffer,buffer_string,_string);
	buffer_save(_buffer,"ProjectWiggle.sav");
	buffer_delete(_buffer);
	
	show_debug_message("Game Saved.");
	show_debug_message(_string);
}