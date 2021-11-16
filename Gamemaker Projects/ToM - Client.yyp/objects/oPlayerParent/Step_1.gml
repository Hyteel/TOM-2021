if ((ds_queue_size(CommandQueue) > 0) && (get_timer() + global.InstMain.ConnectedTimeDifference > ActiveArray[0]))
	{
	ds_list_copy(ActiveCommands, ActiveArray[1]);
	ActiveArray = ds_queue_dequeue(CommandQueue);
	}

