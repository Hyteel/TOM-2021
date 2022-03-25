function scGetAnimProp(AnimationToGet){
#region OldCode
/*	switch (AnimationToGet)
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
*/
#endregion

//New Properties
switch (AnimationToGet)
		{
			//Movement
			#region 0
			case 0: //Nothing
				var APArray = [0, 0, 0, 0, 0, 0, 0];
				break;
				
			default:
				var APArray = [0, 0, 0, 0, 0, 0, 0];
				break;
			#endregion
				
				
			#region	RunLeft
			case 70:
				var Frame1 = [
				1, //SpriteID x >= oOtPlayer.x
				4, //SpriteID x < oOtPlayer.x 
				];
				var Frame2 = [1, 4];
				var Frame3 = [2, 5];
				var Frame4 = [2, 5];
				var Frame5 = [3, 6];
				var Frame6 = [3, 6];
				var Frames = [Frame1, Frame2, Frame3, Frame4, Frame5, Frame6];
				var APArray = [
				70, //ID
				6, //FrameCount
				0, //Animtype, 0 = Movement
				Frames, //Frames
				-400, //MovementSpeed X
				0, //MovementSpeed Y
				];
				break;
			#endregion
				
			
			#region RunRight
			case 80: 
				var Frame1 = [7, 10];
				var Frame2 = [7, 10];
				var Frame3 = [8, 11];
				var Frame4 = [8, 11];
				var Frame5 = [9, 12];
				var Frame6 = [9, 12];
				var Frames = [Frame1, Frame2, Frame3, Frame4, Frame5, Frame6];
				var APArray = [80, 6, 0, Frames, 400, 0];
				break;
			#endregion	
			
			
			#region Jump
			case 30: 
				if (Landed)
					{
					show_debug_message("ACTUAL JUMP");
					var Frame1 = [41, 41];
					var Frame2 = [41, 41];
					var Frame3 = [42, 42];
					var Frame4 = [42, 42];
					var Frame5 = [43, 43];
					var Frame6 = [43, 43];
					var Frames = [Frame1, Frame2, Frame3, Frame4, Frame5, Frame6];
					var APArray = [80, 6, 0, Frames, 0, -1200];
					NoGrav = true;
					Landed = false;
					}
				else
					{
					var APArray = scGetAnimProp(0);
					}
				break;
			#endregion	
			
			
			#region KnockBack Intensity 1 Left
			case 1001: 
				var Frame1 = [23, 23, -10, -50];
				var Frame2 = [24, 24, -10, -50];
				var Frame3 = [25, 25, -10, -20];
				var Frame4 = [26, 26, -10, -20];
				var Frame5 = [27, 27, -10, -20];
				var Frame6 = [28, 28, -10, -20];
				var Frame7 = [29, 29, -10, -20];
				var Frame8 = [30, 30, -10, -20];
				var Frame9 = [31, 31, -10, -20];
				var Frames = [Frame1, Frame2, Frame3, Frame4, Frame5, Frame6, Frame7, Frame8, Frame9];
				var APArray = [1001, 9, 0, Frames, -800, -400];
				NoGrav = true;
				ActiveCommand = 0;
				break;
			#endregion	
			
			
			#region KnockBack Intensity 1 Right
			case 1011: 
				var Frame1 = [32, 32, 10, -50];
				var Frame2 = [33, 33, 10, -50];
				var Frame3 = [34, 34, 10, -20];
				var Frame4 = [35, 35, 10, -20];
				var Frame5 = [36, 36, 10, -20];
				var Frame6 = [37, 37, 10, -20];
				var Frame7 = [38, 38, 10, -20];
				var Frame8 = [39, 39, 10, -20];
				var Frame9 = [40, 40, 10, -20];
				var Frames = [Frame1, Frame2, Frame3, Frame4, Frame5, Frame6, Frame7, Frame8, Frame9];
				var APArray = [1011, 9, 0, Frames, 800, -400];
				NoGrav = true;
				ActiveCommand = 0;
				break;
			#endregion	
			
			
			//Attacks
			#region Jab
			case 1: 
				var Frame1 = [
				16, //SpriteID
				19, //-SpriteID
				0, //TransX 
				0, //TransY
				false, //AttackFrame
				0, //HitboxX
				0, //HitboxY
				0, //HitboxH
				0, //HitboxW
				0, //KnockBackIntensity
				0 //Damage
				];
				var Frame2 = [17, 20, 0, 0, true, 40, 0, 10, 10, 1, 10];
				var Frame3 = [18, 21, 0, 0, true, 40, 0, 10, 10, 1, 10];
				var Frames = [Frame1, Frame2, Frame3];
				var APArray = [1, 3, 1, Frames, 0, 0];
				break;
			#endregion
		}
		
	return (APArray);
}
