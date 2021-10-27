show_debug_message(string(ActiveHeldCommands[|0]));
show_debug_message(string(ActiveCommands[|0]));
if !(scListCompare(ActiveCommands, ActiveHeldCommands))
	{
	show_debug_message("!EQUAL");
	if (global.InstMain.ConnectedTimeDifference + get_timer() >= global.InstMain.CurrentHeldArrayTime)
		{
		show_debug_message("SETTO" + string(ActiveHeldCommands[|0]));
		ds_list_copy(ActiveCommands, ActiveHeldCommands);
		}
	}