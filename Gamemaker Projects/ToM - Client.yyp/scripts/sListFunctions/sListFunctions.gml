function sListCompare(List1, List2){
	var List1Size = ds_list_size(List1);
	var List2Size = ds_list_size(List2);
	if (List1Size != List2Size) {return false;}
	else
		{
		for (var i = 0; i = List1Size; i++)
			{
			if (List1[|i] != List2[|2]) {return false;}
			}
		}
	return true;
}

function sListIndexDoesExist(List, Value){
	if (ds_list_find_index(List, Value) == -1) {return false; }
	else {return true;}
}

