//show_debug_message(string(ActiveHeldCommands[|0]));
//show_debug_message(string(ActiveCommands[|0]));
if !(scListCompare(ActiveCommands, ActiveHeldCommands))
	{
	if (global.InstMain.ConnectedTimeDifference + get_timer() >= CurrentHeldArrayTime)
		{

		ds_list_copy(ActiveCommands, ActiveHeldCommands);
		}
	}