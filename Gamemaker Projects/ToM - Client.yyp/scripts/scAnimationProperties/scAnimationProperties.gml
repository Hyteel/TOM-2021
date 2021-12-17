function scGetAnimProp(AnimationToGet){
	var TempList = ds_list_create();
	
	switch (AnimationToGet)
		{
			case 0: //Nothing
				ds_list_add(TempList, 
				0, //Frames
				0 //ID
				);
				break;
				
			default: //Nothing
				ds_list_add(TempList, 
				0, //Frames
				0 //ID
				);
				break;
			
			
			case 70: //Run Left
				ds_list_add(TempList, 
				6, //Frames
				70, //ID
				true, //Continous
				true, //Simplified
				true, //Movement / Ability
				-6,  //MovementX
				0, //MovementY
				1, //Animation Start (Frame)
				3, //Animation End (Frame)
				true, //Directional Movement
				true, //Left Initial direction
				4, //Animation Start Directional
				6, //Animation End Directional
				);
				break;
				
				
			case 80: //Run Right
				ds_list_add(TempList, 
				6, //Frames
				80, //ID
				true, //Continous
				true, //Simplified
				true, //Movement / Ability
				6,  //MovementX
				0, //MovementY
				7, //Animation Start (Frame)
				9, //Animation End (Frame)
				true, //Directional Movement
				false, //Left Initial direction
				10, //Animation Start Directional
				12, //Animation End Directional
				);
				break;
		
		
			case 1000: //Knockback LEFT
				ds_list_add(TempList,
				9,
				1000,
				false,
				true,
				true,
				0,
				0,
				19,
				28,
				false
				);
				break;
				
				
			case 1001: //Knockback RIGHT
				ds_list_add(TempList,
				9,
				1001,
				false,
				true,
				true,
				0,
				0,
				29,
				38,
				false
				);
				break;
		
		
			case 1: //Jab
				ds_list_add(TempList, 
				3, //Frames
				1, //ID
				true, //Continous
				true, //Simplified
				false, //Movement / Ability
				true,  //Knockback
				-5, //KnockbackY
				10, //KnockbackX
				10, //Damage
				10, //Range
				13, //Animation Start (Frame)
				15, //Animation End (Frame)
				true, //Directional Movement
				false, //Left Initial direction
				16, //Animation Start Directional
				18, //Animation End Directional
				);
				break;
		
		}
	
	return (TempList);
}

