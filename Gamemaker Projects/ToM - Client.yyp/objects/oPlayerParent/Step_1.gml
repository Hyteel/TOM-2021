if ((Id == 1) || (Id == 0))
	{
	BasicId = Id;
	if (Id == 0) { Id = global.InstOtPlayer; }
	else { Id = global.InstLocalPlayer; }
	}
	
if (Health <= 0)
	{
	Dead = true;
	}