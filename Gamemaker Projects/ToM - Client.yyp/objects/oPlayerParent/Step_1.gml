#macro sLIDE sListIndexDoesExist


//Horizontal Movement	
if (sLIDE(ActiveCommands, PCommands.MoveLeft)) || (sLIDE(ActiveCommands, PCommands.MoveRight)) 
	{
	if (LastDirection != ovarLastInput)
		{
		LastDirection = ovarLastInput;
		CurrentMovementSpeed = BaseMovementSpeed;
		}
	else
		{
		if (CurrentMovementSpeed != MaxMovementSpeed)
			{
			CurrentMovementSpeed += Acceleration;
			}
		}
	if (sLIDE(ActiveCommands, PCommands.MoveLeft)) {var Direction = -1; }
	else {Direction = 1; }
	x += CurrentMovementSpeed * Direction;
	}
else 
	{
	LastDirection = 0; 
	CurrentMovementSpeed -= Decceleration;
	if (CurrentMovementSpeed - Decceleration < 0) {CurrentMovementSpeed = 0; }
	else {x += CurrentMovementSpeed; }
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

