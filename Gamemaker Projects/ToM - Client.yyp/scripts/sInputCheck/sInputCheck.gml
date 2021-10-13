function sInputCheck(CharValue, Command){
	var ExistingIndex = ds_list_find_index(CurrentInputs, Command);
	if (keyboard_check(CharValue)) 
		{ 
		if (ExistingIndex == -1) {ds_list_add(CurrentInputs, Command); }		
		}    
	else if (ExistingIndex != -1) {ds_list_delete(CurrentInputs, ExistingIndex); }
}