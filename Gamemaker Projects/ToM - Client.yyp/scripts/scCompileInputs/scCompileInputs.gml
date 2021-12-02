function scCompileInputs(){
	//Movement
	var Movement = 0;
	if (keyboard_check(38)) //Up
		{
		if ((keyboard_check(37)) && !(keyboard_check(39))) { Movement = 1; } 
		else if ((keyboard_check(39)) && !(keyboard_check(37))) { Movement = 2; }
		else { Movement = 3; }
		}
	else if (keyboard_check(40)) //Down
		{
		if ((keyboard_check(37)) && !(keyboard_check(39))) { Movement = 4; } 
		else if ((keyboard_check(39)) && !(keyboard_check(37))) { Movement = 5; }
		else { Movement = 6; }
		}
	else if ((keyboard_check(37)) && !(keyboard_check(39))) { Movement = 7; } //Left
	else if ((keyboard_check(39)) && !(keyboard_check(37))) { Movement = 8; } //Right
	
	//Abilities
	if (keyboard_check(81)) { return(Movement*10 + 1); } //Q
	else if (keyboard_check(87)) { return(Movement*10 + 2); } //W
	else if (keyboard_check(69)) { return(Movement*10 + 3); } //E
	else if (keyboard_check(82)) { return(Movement*10 + 4); } //R
	else { return(Movement*10); }
		
}