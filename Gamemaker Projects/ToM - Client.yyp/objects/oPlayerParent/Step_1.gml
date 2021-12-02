if (get_timer() + global.InstMain.ConnectedTimeDifference > ActiveArray[0])
	{
	if (ds_queue_size(CommandQueue) > 0)
		{
		if (ActiveArray[0] == 0)
			{
			ActiveArray = ds_queue_dequeue(CommandQueue);
			}
		else
			{
			ActiveCommand = ActiveArray[1];
			ActiveArray = ds_queue_dequeue(CommandQueue);
			LastCopy = false;
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
