///@function create_dialogue();
///@param {string} Text
///@param {index} Speaker
///@param *Effects
///@param *Speed
///@param *Type
///@param *Next_Line
///@param *Scripts
///@param *Text_Col

function create_dialogue() {
	if(instance_exists(obj_textbox)) exit;

	//Create the Textbox
	var _textbox = instance_create_layer(x,y, "Text", obj_textbox);

	//Get Arguments
	var arg = 0, i = 0, arg_count = argument_count;
	repeat(arg_count){ arg[i] = argument[i]; i++; } 

	//Get arguments
	var _text = arg[0];
	var _speaker, text_len;

	//If Text or Speaker aren't arrays (single line input), make them arrays 
	if(is_array(_text))		{ text_len = array_length(_text); }
	else					{ text_len = 1; _text[0] = _text;  }
	if(!is_array(arg[1]))	{ _speaker = array_create(text_len, id); }
	else					{ _speaker = arg[1]; }

	//Get rest of arguments, fill with default
	var _effects	= array_create(text_len, [1,0]);
	var _speed		= array_create(text_len, [1,0.5]);
	var _textcol	= array_create(text_len, [1,c_white]);
	var _type		= array_create(text_len, 0);
	var _nextline	= array_create(text_len, 0);
	var _script		= array_create(text_len, 0);
	var _creator	= array_create(text_len, id);

	var a;
	//Fill variables depending on argument count
	switch(arg_count-1){
		case 7: a = arg[7];	if(array_length(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _textcol[i] = a[i]; }
		case 6: a = arg[6];	if(array_length(a) != text_len){ a[text_len] =-1; } for(i = 0; i < text_len; i++){ if(a[i] !=-1) _script[i] = a[i]; }
		case 5: a = arg[5];	if(array_length(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _nextline[i] = a[i]; }
		case 4: a = arg[4];	if(array_length(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _type[i] = a[i]; }
		case 3: a = arg[3];	if(array_length(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _speed[i] = a[i]; }
		case 2: a = arg[2];	if(array_length(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _effects[i] = a[i]; }
	}

	//Change the Textbox Values
	with(_textbox){
		creator		= _creator;
		effects		= _effects;
		text_speed	= _speed;
		type		= _type;
		text		= _text;
		nextline	= _nextline;
		executeScript = _script;
		text_col	= _textcol;
	
		//Speaker's Variables
		i = 0; repeat(text_len){
			portrait[i]			= _speaker[i].myPortrait;
			pitch[i]			= _speaker[i].myPitch;
			font[i]				= _speaker[i].myFont;
			name[i]				= _speaker[i].myName;
			speaker[i]			= _speaker[i];
			i++;
		}
		event_perform(ev_alarm, 1);	//makes textbox perform "setup"
	}
	return _textbox;
}