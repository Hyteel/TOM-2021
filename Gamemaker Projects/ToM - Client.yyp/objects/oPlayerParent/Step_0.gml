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




