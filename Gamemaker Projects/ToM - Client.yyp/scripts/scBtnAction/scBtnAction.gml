// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scBtnAction(BtnType){
	switch (BtnType)
		{
		case 1:
			EntryInstance.Start = true;
			break;
			
		case 2:
			game_end();
			break;
		}
}