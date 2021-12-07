function scAnimationProperties(AnimationToGet){
	var TempList = ds_list_create();
	
	switch (AnimationToGet)
		{
			case 70: //Run Left
				ds_list_add(TempList, 
				5, //Frames
				true, //Continous
				false, //Breakable
				true, //Movement / Ability
				-5, 
				)
				break;
		
		}
	
	return (TempList);
}