/// @description Dialogue Choice

//This is made to be an alarm so we can have a small "pause" after selecting a dialogue option

#region Update choice and page

//Change an object's variable according to choice if applicable
var cv = executeScript[page];
if(is_array(cv)){
	cv = cv[choice];
	var len = array_length(cv)-1;
	var cva = array_create(len, 0);
	array_copy(cva, 0, cv, 1, len); 
	script_execute_alt(cv[0], cva);
}

//Update page
if(page+1 < array_length(text)){
	var nl = nextline[page];
	switch(nl[choice]){
		case -1: obj_player.active_textbox=noone;
			instance_destroy();	exit;
		case  0: page += 1;				break;
		default: page = nl[choice];
	}
	//Performs Setup
	event_perform(ev_alarm, 1);
} else {
	obj_player.active_textbox=noone;
	instance_destroy();	
}

chosen = false;
#endregion