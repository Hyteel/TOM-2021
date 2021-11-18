// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scGetOppositePlayer(ScSocket, SocketList){
	if (ds_list_find_index(SocketList, ScSocket) == 1) { return 0;}
	else {return 1;}
}