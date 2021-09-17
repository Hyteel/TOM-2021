//Movement
show_debug_message("GOTTHISFAR");
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
	}
	
show_debug_message("GOTTHISFAR2");
if (ovarLastInput != 0) 
	{
	if (LastDirection == 37) {var Direction = -1; }
	else {Direction = 1; }
	x += CurrentMovementSpeed * Direction;
	}
else {LastDirection = 0;}