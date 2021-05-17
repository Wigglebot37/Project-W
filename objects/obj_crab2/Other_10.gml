switch(choice_variable){
	case -1:
	#region First Dialogue
		//Line 0
		var i = 0;
		myText[i]		= "I'm here to help you pick how many party members you want.";
		mySpeaker[i]	= id;
		
		//Line 1
		i++;
		myText[i]		= "So what'll it be?";
		mySpeaker[i]	= id;
		
		//Line 2
		i++;
		myText[i]		= ["Solo", "2 bros", "3 dudes", "4 peeps"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_everett;
		myScripts[i]	= [[change_variable,noone,"pl_count",1], [change_variable,noone,"pl_count",2], 
							[change_variable,noone,"pl_count",3], [change_variable,noone,"pl_count",4]];
		myNextLine[i]	= [3,3,3,3];

		//Line 3
		i++;
		myText[i]		= "Enjoy having friends for once. (or not)";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1;
	#endregion
	break;
}