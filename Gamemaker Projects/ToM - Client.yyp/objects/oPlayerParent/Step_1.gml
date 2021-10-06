//Movement	
if ((ovarLastInput == 37) || (ovarLastInput == 39)) 
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
	if (LastDirection == 37) {var Direction = -1; }
	else {Direction = 1; }
	x += CurrentMovementSpeed * Direction;
	}
else {LastDirection = 0;}	

if (LagX != 0)
	{
		if (LagX > 0)
			{
			if ((LagX - LagXSpeed) > 0)
				{
				x += LagXSpeed;
				LagX -= LagXSpeed;
				}
			}
		else
			{
			if ((LagX + LagXSpeed) < 0)
				{
				x -= LagXSpeed;
				LagX += LagXSpeed;
				}
			}
	}

if (LagY != 0)
	{
		if (((LagY + LagYSpeed) > 0) || ((LagY - LagYSpeed) < 0)) { LagY = 0;}
		else if (LagY > 0)
			{
			y += LagYSpeed;
			LagY += LagYSpeed;
			}
		else
			{
			y -= LagYSpeed;
			LagY -= LagYSpeed;
			}
	}