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
	if (sLIDE(ActiveCommands, PCommands.MoveLeft)) {var Direction = -1; if (scCollisionCheck("Left")) { HorizontalSpeed = 0;} }
	else {Direction = 1; if (scCollisionCheck("Right")) { HorizontalSpeed = 0;}}
	x += HorizontalSpeed * Direction;
	}
else 
	{
	LastDirection = 0; 
	}	


//Gravity
if !(CurrentlyJumping)
	{
	if (scCollisionCheck("Down")) { VerticalSpeed = 0; }
	else { y += VerticalSpeed; VerticalSpeed += Gravity; }
	}


//LagCompensation
if (LagX != 0)
	{
		if (LagX > 0) 
			{
			if (LagX - LagXSpeed < 0) { LagX = 0; }
			else
				{
				x += LagXSpeed;
				LagX -= LagXSpeed;
				}
			}
		else
			{
			if (LagX + LagXSpeed > 0) { LagX = 0; }
			else
				{
				x -= LagXSpeed;
				LagX += LagXSpeed;
				}
			}
	}

