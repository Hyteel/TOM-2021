#macro GetFrame CurrentAnimation[3][CurrentFrame]

#region Oldcode
/*
//NEW MOVEMENT
if (CurrentFrame >= CurrentAnimation[|0]) 
	{ 
	if (CurrentAnimation[|0] == ActiveCommand)
		{
		if (ActiveCommand != 0) 
			{
			CurrentFrame = 0;
			}
		}
	else
		{
		ds_list_copy(CurrentAnimation, scGetAnimProp(ActiveCommand)); 
		CurrentFrame = 0;
		if (CurrentAnimation[|4]) 
			{ 
			if ((x > Id.x) && !(CurrentAnimation[|10]) || (x < Id.x) && (CurrentAnimation[|10])) { CurrentAnimationFrame = CurrentAnimation[|11]; }
			else { CurrentAnimationFrame = CurrentAnimation[|7]; }
			}
		else 
			{ 
			if ((x < Id.x) && (CurrentAnimation[|13])) || ((x > Id.x) && !(CurrentAnimation[|13])) {CurrentAnimationFrame = CurrentAnimation[|14]; }
			else { CurrentAnimationFrame = CurrentAnimation[|11];}
			}
		}
	}


var Timer = get_timer();

if (Timer > SlowDownVar + 100000)
	{
	SlowDownVar = Timer
	if (CurrentAnimation[|1] != 0)
		{
		if (CurrentAnimation[|3]) //Simplified
			{
			if !(CurrentAnimation[|4]) //Combat
				{
				show_debug_message("COMBAT");
				if (CurrentAnimation[|12]) //If directional attack
					{
					if ((x > Id.x) && !(CurrentAnimation[|13])) //Right of OtP moving right
						{
						if (CurrentAnimationFrame >= CurrentAnimation[|15]) {CurrentAnimationFrame = CurrentAnimation[|14]; }
						else 
							{ 
							CurrentAnimationFrame += 1; 
							scHitscan(CurrentAnimation, 0); 
							} 
						}
					else if ((x < Id.x) && (CurrentAnimation[|13])) //Left of OtP moving left
						{
						if (CurrentAnimationFrame >= CurrentAnimation[|15]) {CurrentAnimationFrame = CurrentAnimation[|14]; }
						else 
							{ 
							CurrentAnimationFrame += 1;
							scHitscan(CurrentAnimation, 1); 
							} 
						}
					else //Moving in destined direction
						{
						if (CurrentAnimationFrame >= CurrentAnimation[|12]) {CurrentAnimationFrame = CurrentAnimation[|11]; }
						else { CurrentAnimationFrame += 1; }
						if (CurrentAnimation[|13]) { scHitscan(CurrentAnimation, 0); }
						else { scHitscan(CurrentAnimation, 1); }
						}
					}
				else
					{
					if (CurrentAnimationFrame >= CurrentAnimation[|12]) {CurrentAnimationFrame = CurrentAnimation[|11]; }
					else { CurrentAnimationFrame += 1; } 
					if (CurrentAnimation[|13]) { scHitscan(CurrentAnimation, 0); }
					else { scHitscan(CurrentAnimation, 1); }
					}
				}
			else
				{
				var Xval = CurrentAnimation[|5]/CurrentAnimation[|0];
				var Yval = CurrentAnimation[|6]/CurrentAnimation[|0];
		
				if !(scCollisionCheck("X", Xval)) { x += Xval; }
				if !(scCollisionCheck("Y", Yval)) { y += Yval; }
		
				if (CurrentAnimation[|9])
					{
					if ((x > Id.x) && !(CurrentAnimation[|10])) //Right of OtP moving right
						{
						if ((CurrentAnimationFrame >= CurrentAnimation[|12]) || (CurrentAnimationFrame == undefined)) {CurrentAnimationFrame = CurrentAnimation[|11]; }
						else 
							{ 
							CurrentAnimationFrame += 1; 
							} 
						}
					else if ((x < Id.x) && (CurrentAnimation[|10])) //Left of OtP moving left
						{
						if (CurrentAnimationFrame >= CurrentAnimation[|12]) {CurrentAnimationFrame = CurrentAnimation[|11]; }
						else 
							{ 
							CurrentAnimationFrame += 1; 
							} 
						}
					else //Moving in destined direction
						{
						if (CurrentAnimationFrame >= CurrentAnimation[|8]) {CurrentAnimationFrame = CurrentAnimation[|7]; }
						else { CurrentAnimationFrame += 1; } 
						}
					}
				else
					{
					if (CurrentAnimationFrame >= CurrentAnimation[|8]) {CurrentAnimationFrame = CurrentAnimation[|7]; }
					else { CurrentAnimationFrame += 1; } 
					}
				}
			}
		
		image_index = CurrentAnimationFrame;
		CurrentFrame += 1;
		}
	else
		{
		image_index = 0;
		}
	}

*/
#endregion

//New Movement #2
//Animation Start
if (CurrentFrame >= CurrentAnimation[1]) 
	{ 
	if (CurrentAnimation[0] == ActiveCommand)
		{
		if (ActiveCommand != 0) 
			{
			CurrentFrame = 0;
			}
		}
	else
		{
		CurrentAnimation = scGetAnimProp(ActiveCommand); 
		CurrentFrame = 0;
		}
	}


//Animation
var Timer = get_timer();

if (Timer > SlowDownVar + SlowDownConstant)
	{
	SlowDownVar = Timer
	if (CurrentAnimation[0] == 0)
		{
		image_index = 0;
		}
	else
		{
		var Xval = GetFrame[2];
		var Yval = GetFrame[3];
			
		if !(scCollisionCheck("X", Xval)) { x += Xval; }
		if !(scCollisionCheck("Y", Yval)) { y += Yval; }
			
		if (x < oOtPlayer.x) { image_index = GetFrame[1]; }
		else { image_index = GetFrame[0]; }	
		
		if (CurrentAnimation[2] == 1) //Combat
			{
			if (x < oOtPlayer.x) { if (GetFrame[4]) { scHitscan(10, GetFrame[5], GetFrame[6], GetFrame[7], GetFrame[8], GetFrame[9], GetFrame[10]); }} //Attacking Right
			else { if (GetFrame[4]) { scHitscan(0, GetFrame[5], GetFrame[6], GetFrame[7], GetFrame[8], GetFrame[9], GetFrame[10]); }}
			}
		}
	}
	
	
//Gravity
if !(scCollisionCheck("Y", Gravity)) 
	{ 
	y += Gravity; 
	if (Gravity < MaxGravity) { Gravity += GravityAcceleration; }
	}
else
	{
	Gravity = BaseGravity;
	}




