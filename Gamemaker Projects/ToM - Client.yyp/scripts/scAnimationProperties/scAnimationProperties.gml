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
				LastAnimation = 0;
				break;
				
			default:
				var APArray = [0, 0, 0, 0, 0, 0, 0];
				LastAnimation = 0;
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
				-300, //MovementSpeed X
				0, //MovementSpeed Y
				];
				LastAnimation = 70;
				break;
			#endregion
				
			
			#region RunRight
			case 80: 
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
				var APArray = [80, 6, 0, Frames, 300, 0];
				LastAnimation = 80;
				break;
			#endregion	
			
			
			#region Jump
			case 30: 
				if (Landed)
					{
					var Frame1 = [8, 14];
					var Frame2 = [8, 14];
					var Frame3 = [9, 15];
					var Frame4 = [9, 15];
					var Frame5 = [10, 16];
					var Frame6 = [10, 16];
					var Frame7 = [11, 17];
					var Frame8 = [11, 17];
					var Frame9 = [12, 18];
					var Frame10 = [12, 18];
					var Frame11 = [13, 19];
					var Frame12 = [13, 19];
					var Frames = [Frame1, Frame2, Frame3, Frame4, Frame5, Frame6, Frame7, Frame8, Frame9, Frame10, Frame11, Frame12];
					var APArray = [80, 6, 0, Frames, 0, -1200];
					}
				else
					{
					var APArray = [0, 0, 0, 0, 0, 0, 0];
					}
				break;
			#endregion	
			
			
			#region KnockBack Intensity 1 Left
			case 1001: 
				var Frame1 = [10, 16];
				var Frame2 = [10, 16];
				var Frame3 = [11, 17];
				var Frame4 = [11, 17];
				var Frame5 = [10, 16];
				var Frame6 = [10, 16];
				var Frame7 = [11, 17];
				var Frame8 = [11, 17];
				var Frames = [Frame1, Frame2, Frame3, Frame4, Frame5, Frame6, Frame7, Frame8];
				var APArray = [1001, 9, 0, Frames, -800, -400];
				NoGrav = true;
				ActiveCommand = 0;
				LastAnimation = 1001;
				break;
			#endregion	
			
			
			#region KnockBack Intensity 1 Right
			case 1011: 
				var Frame1 = [10, 16];
				var Frame2 = [10, 16];
				var Frame3 = [11, 17];
				var Frame4 = [11, 17];
				var Frame5 = [10, 16];
				var Frame6 = [10, 16];
				var Frame7 = [11, 17];
				var Frame8 = [11, 17];
				var Frames = [Frame1, Frame2, Frame3, Frame4, Frame5, Frame6, Frame7, Frame8];
				var APArray = [1011, 9, 0, Frames, 800, -400];
				NoGrav = true;
				ActiveCommand = 0;
				LastAnimation = 1011;
				break;
			#endregion	
			
			
			//Attacks
			#region Jab
			case 1: 
				if (LastAnimation != 1)
					{
					var Frame1 = [
					27, //SpriteID
					21, //-SpriteID
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
					var Frame2 = [28, 22, 0, 0, true, 5, 0, 30, 30, 1, 1];
					var Frame3 = [29, 23, 0, 0, true, 5, 0, 30, 30, 1, 1];
					var Frame4 = [30, 24, 0, 0, true, 5, 0, 30, 30, 1, 1];
					var Frame5 = [31, 25, 0, 0, true, 5, 0, 30, 30, 1, 1];
					var Frame6 = [32, 26, 0, 0, true, 5, 0, 30, 30, 1, 1];
					var Frames = [Frame1, Frame2, Frame3, Frame4, Frame5, Frame6];
					var APArray = [1, 6, 1, Frames, 0, 0];
					LastAnimation = 1;
					break;
					}
				else
					{
					var APArray = [0, 0, 0, 0, 0, 0, 0];
					}
				break;
			#endregion
			
			#region Charge Left
			case 2: 
				if (LastAnimation != 2)
					{
					var Frame1 = [
					33, //SpriteID
					33, //-SpriteID
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
					var Frame2 = [34, 34, 0, 0, true, 5, 0, 30, 30, 1, 1];
					var Frame3 = [35, 35, 0, 0, true, 5, 0, 30, 30, 1, 1];
					var Frame4 = [36, 36, 0, 0, true, 5, 0, 30, 30, 1, 1];
					var Frame5 = [37, 37, 0, 0, true, 5, 0, 30, 30, 1, 1];
					var Frames = [Frame1, Frame2, Frame3, Frame4, Frame5];
					var APArray = [2, 5, 1, Frames, -700, 0];
					LastAnimation = 1;
					}
				else
					{
					var APArray = [0, 0, 0, 0, 0, 0, 0];
					}	 
				break;
			#endregion
			
			#region Charge Left
			case 3: 		
				if (LastAnimation != 3)
				{
					var Frame1 = [
					38, //SpriteID
					38, //-SpriteID
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
					var Frame2 = [39, 39, 0, 0, true, 5, 0, 30, 30, 1, 1];
					var Frame3 = [40, 40, 0, 0, true, 5, 0, 30, 30, 1, 1];
					var Frame4 = [41, 41, 0, 0, true, 5, 0, 30, 30, 1, 1];
					var Frame5 = [42, 42, 0, 0, true, 5, 0, 30, 30, 1, 1];
					var Frames = [Frame1, Frame2, Frame3, Frame4, Frame5];
					var APArray = [3, 5, 1, Frames, 700, 0];
					LastAnimation = 1;
				}
				else
					{
					var APArray = [0, 0, 0, 0, 0, 0, 0];
					}
				break;
			#endregion
		}
		
	return (APArray);
}
