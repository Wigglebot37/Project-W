///@function load_game();

function load_game() {
	with(obj_player) instance_destroy();
	if(file_exists("ProjectWiggle.sav")) {
		var _buffer=buffer_load("ProjectWiggle.sav");
		var _string=buffer_read(_buffer,buffer_string);
		buffer_delete(_buffer);
		
		// Takes json string turns it into array of structs
		var _loadData=json_parse(_string);
		
		while(array_length(_loadData)>0) {
			var _loadEntity=array_pop(_loadData);
			with(instance_create_layer(0,0,layer,asset_get_index(_loadEntity.obj))) {
				x=_loadEntity.x;
				y=_loadEntity.y;
			}
		}
		
		show_debug_message("Game Loaded.");
		show_debug_message(_string);
	} else show_debug_message("Cannot find ProjectWiggle.sav");
}