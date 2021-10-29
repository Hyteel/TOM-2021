//show_debug_message(string(ActiveHeldCommands[|0]));
//show_debug_message(string(ActiveCommands[|0]));
if (CurrentCommandPosition == 10) {  var  ActualComPos = -1; } else { var ActualComPos = CurrentCommandPosition; }

if (QueuedCommands[# 1,  ActualComPos + 1] > QueuedCommands[# 1,  CurrentCommandPosition])
	{
	if (global.InstMain.ConnectedTimeDifference + get_timer() >= QueuedCommands[# 1, ActualComPos + 1])
		{
		if (CurrentCommandPosition == 10) {CurrentCommandPosition = 0}
		else { CurrentCommandPosition++; }
		ds_list_copy(ActiveCommands, QueuedCommands[# 0, CurrentCommandPosition]);
		}
	}