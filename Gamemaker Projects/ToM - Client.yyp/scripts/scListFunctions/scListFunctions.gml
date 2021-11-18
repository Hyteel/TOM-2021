function scListCompare(List1, List2){
	var List1Size = ds_list_size(List1);
	var List2Size = ds_list_size(List2);
	if (List1Size != List2Size) {return false;}
	else
		{
		for (var i = 0; i < List1Size; i++)
			{
			if (List1[|i] != List2[|i]) { return false;}
			}
		}
	return true;
}


function scListIndexDoesExist(List, Value){
	if (ds_list_find_index(List, Value) == -1) {return false; }
	else {return true;}
}


function scListExists(List){
	if (ds_list_find_value(List, 0) == undefined) {return false; }
	else {return true; }
}