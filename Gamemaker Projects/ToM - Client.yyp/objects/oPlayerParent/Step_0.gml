
/*
//Horizontal Movement	
if (sLIDE(ActiveCommands, PCommands.MoveLeft)) || (sLIDE(ActiveCommands, PCommands.MoveRight)) 
	{
	if (LastDirection != ovarLastInput)
		{
		LastDirection = ovarLastInput;
		HorizontalSpeed = BaseHorizontalSpeed;
		}
	else
		{
		if (HorizontalSpeed != MaxHorizontalSpeed)
			{
			HorizontalSpeed += Acceleration;
			}
		}
	if (sLIDE(ActiveCommands, PCommands.MoveLeft)) {var Direction = -1; if (scCollisionCheck("Left")) { Direction = 0;} }
	else {Direction = 1; if (scCollisionCheck("Right")) { Direction = 0;}}
	x += HorizontalSpeed * Direction;
	}
else 
	{
	LastDirection = 0; 
	}	


//Jumping
if (sLIDE(ActiveCommands, PCommands.MoveUp))
	{
	if (!(CurrentlyJumping) && (scCollisionCheck("Down")))
		{
		VerticalSpeed = 0;
		CurrentlyJumping = true;
		y -= InitialJumpHeight;
		CurrentJumpFrame = 0;
		}
	else if (CurrentlyJumping)
		{
		y -= AdditionalJumpHeight;
		CurrentJumpFrame += 1;
		if (CurrentJumpFrame >= MaxJumpFrames) { CurrentlyJumping = false; }
		}
	}
else
	{
	CurrentlyJumping = false;	
	}


//Gravity
if (scCollisionCheck("Down")) { VerticalSpeed = 0; }
else
	{
	if !(CurrentlyJumping)
		{
		if !(VerticalSpeed + Gravity >= MaxGravity) { VerticalSpeed += Gravity;}
		y += VerticalSpeed;  
		}
	}


//Animation
var CAP = scGetAnimProp(CurrentAnimation);
if (CurrentFrame > CAP[0])
	{
	if ((sLIDE(ActiveCommands, PCommands.MoveLeft)) && !(sLIDE(ActiveCommands, PCommands.MoveRight))) { CurrentAnimation = Animations.MoveLeft; }
	if (!(sLIDE(ActiveCommands, PCommands.MoveLeft)) && (sLIDE(ActiveCommands, PCommands.MoveRight))) { CurrentAnimation = Animations.MoveRight; }
	
	}
else
	{
		
	}


*/


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
		CurrentAnimationFrame = CurrentAnimation[|8];
		}
	}


var Timer = get_timer();

if (Timer > SlowDownVar + 100000)
	{
	SlowDownVar = Timer
	if (CurrentAnimation[|1] != 0)
		{
		if (CurrentAnimation[|4]) //Simplified
			{
			if !(CurrentAnimation[|3])
				{
				
				}
			else
				{
				var Xval = CurrentAnimation[|5]/CurrentAnimation[|0];
				var Yval = CurrentAnimation[|6]/CurrentAnimation[|0];
		
				if !(scCollisionCheck("X", Xval)) { x += Xval; }
				if !(scCollisionCheck("Y", Yval)) { y += Yval; }
		
		
				if (CurrentAnimationFrame >= CurrentAnimation[|8]) {CurrentAnimationFrame = CurrentAnimation[|7]; }
				else { CurrentAnimationFrame += 1; } 
				
				image_index = CurrentAnimationFrame;
				CurrentFrame += 1;
				}
			}
		}
	else
		{
		image_index = 0;
		}
	}







