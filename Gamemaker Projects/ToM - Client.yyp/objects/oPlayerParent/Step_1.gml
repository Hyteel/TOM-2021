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
			LastInputTime = get_timer();
			
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
				
			var File = file_text_open_append(working_directory + "\ACCInputs" + string(Id) + ".txt");
			var StringToWrite = string(string(LastInputTime + global.InstMain.ConnectedTimeDifference) + " " + string(ActiveCommand) + string(get_timer() + global.InstMain.ConnectedTimeDifference) + "\n");
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
	if (Id == 0) { Id = global.InstOtPlayer; }
	else { Id = global.InstLocalPlayer; }
	}