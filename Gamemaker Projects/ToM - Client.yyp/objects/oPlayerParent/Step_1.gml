if (get_timer() + global.InstMain.ConnectedTimeDifference > ActiveArray[0])
	{
	if (ds_queue_size(CommandQueue) > 0)
		{
		if (ActiveArray[0] == 0)
			{
			ActiveArray = ds_queue_dequeue(CommandQueue);
			ActiveArray[0] += 500000;
			}
		else
			{
			var DeQ = ds_queue_dequeue(CommandQueue);
			if (floor(DeQ[1]/1000) != 0)
				{
				CurrentFrame = 0;
				CurrentAnimation = scGetAnimProp(DeQ[1]);
				Health -= DeQ[2];
				}
			else
				{
				ActiveCommand = ActiveArray[1];
				ActiveArray = DeQ;
				LastCopy = false;
				}
			ActiveArray[0] += 500000;
			}
		}
	else
		{
		if !(LastCopy)
			{
			ActiveCommand = ActiveArray[1];
			LastCopy = true;
			}
		}
	}


if ((Id == 1) || (Id == 0))
	{
	if (Id == 0) { Id = global.InstOtPlayer; }
	else { Id = global.InstLocalPlayer; }
	}