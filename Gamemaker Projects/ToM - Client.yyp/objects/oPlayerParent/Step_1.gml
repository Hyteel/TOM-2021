/*if ((get_timer() + global.InstMain.ConnectedTimeDifference > ActiveArray[0]))
	{
	if (ds_queue_size(CommandQueue) > 0)
		{
		if (ActiveArray[0] == 0)
			{
			ActiveArray = ds_queue_dequeue(CommandQueue);
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
			var File = file_text_open_append(working_directory + "\Inputs" + string(Id) + "Dequeued" + ".txt");
			var StringToWrite = string(get_timer() +  global.InstMain.ConnectedTimeDifference) + " " + string(ActiveCommand) + "\n";
			file_text_write_string(File, StringToWrite);
			file_text_close(File);
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
	}*/


if ((Id == 1) || (Id == 0))
	{
	BasicId = Id;
	if (Id == 0) { Id = global.InstOtPlayer; }
	else { Id = global.InstLocalPlayer; }
	}