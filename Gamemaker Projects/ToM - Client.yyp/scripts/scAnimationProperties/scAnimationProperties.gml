function scGetAnimProp(AnimationToGet){
	var TempList = ds_list_create();
	
	switch (AnimationToGet)
		{
			case 0: //Nothing
				ds_list_add(TempList, 
				0, //Frames
				0, //ID
				false, //Continous
				true, //Movement / Ability
				true, //Simplified INDX5
				0,  //MovementX
				0, //MovementY
				0, //Animation Start (Frame)
				0 //Animation End (Frame)
				)
				break;
			
			
			case 70: //Run Left
				ds_list_add(TempList, 
				100, //Frames
				70, //ID
				true, //Continous
				true, //Simplified
				true, //Movement / Ability
				-100,  //MovementX
				0, //MovementY
				1, //Animation Start (Frame)
				3 //Animation End (Frame)
				)
				break;
				
				
			case 80: //Run Left
				ds_list_add(TempList, 
				100, //Frames
				70, //ID
				true, //Continous
				true, //Simplified
				true, //Movement / Ability
				100,  //MovementX
				0, //MovementY
				4, //Animation Start (Frame)
				6 //Animation End (Frame)
				)
				break;
		
		}
	
	return (TempList);
}

