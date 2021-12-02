#macro sLIDE scListIndexDoesExist


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
var CAP = scAnimationProperties(CurrentAnimation);
if (CurrentFrame > CAP[0])
	{
	if ((sLIDE(ActiveCommands, PCommands.MoveLeft)) && !(sLIDE(ActiveCommands, PCommands.MoveRight))) { CurrentAnimation = Animations.MoveLeft; }
	if (!(sLIDE(ActiveCommands, PCommands.MoveLeft)) && (sLIDE(ActiveCommands, PCommands.MoveRight))) { CurrentAnimation = Animations.MoveRight; }
	
	}
else
	{
		
	}


















