function scAnimationProperties(AnimationToGet){
	var TempList = ds_list_create();
	
	switch (AnimationToGet)
		{
			case 0: //Nothing
				ds_list_add(TempList, 
				0, //Frames
				0, //ID
				false, //Continous
				false, //Breakable
				true, //Movement / Ability
				true, //Simplified INDX5
				0,  //MovementX
				0, //MovementY
				)
				break;
			
			case 70: //Run Left
				ds_list_add(TempList, 
				5, //Frames
				70, //ID
				true, //Continous
				false, //Breakable
				true, //Simplified
				true, //Movement / Ability
				-5,  //MovementX
				0 //MovementY
				)
				break;
				
			
		
		}
	
	return (TempList);
}