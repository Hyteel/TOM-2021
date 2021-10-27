//New Input sys
scInputCheck(37, PCommands.MoveLeft);
scInputCheck(38, PCommands.MoveUp);
scInputCheck(39, PCommands.MoveRight); 
scInputCheck(40, PCommands.MoveDown);

var Size = ds_list_size(CurrentInputs);

if (!(scListCompare(OldInputs, CurrentInputs)))
	{
	//CurrentSentInputs += 1;
	//show_debug_message("CurrentSentInputs: " + string(CurrentSentInputs));
	if (Size != 0)
		{
		buffer_seek(global.ClientBuffer, buffer_seek_start, 0);
		buffer_write(global.ClientBuffer, buffer_u8, Network.SendCurrentInput);
		buffer_write(global.ClientBuffer, buffer_u8, Size);
		for (var i = 0; i < Size; i++;)
			{
			buffer_write(global.ClientBuffer, buffer_u8, CurrentInputs[| i]);
			}
		network_send_packet(global.ClientSocket, global.ClientBuffer, buffer_tell(global.ClientBuffer));
		Sendofftime = get_timer();
		}
	else
		{
		buffer_seek(global.ClientBuffer, buffer_seek_start, 0);
		buffer_write(global.ClientBuffer, buffer_u8, Network.SendCurrentInput);
		buffer_write(global.ClientBuffer, buffer_u8, 0);
		network_send_packet(global.ClientSocket, global.ClientBuffer, buffer_tell(global.ClientBuffer));
		Sendofftime = get_timer();
		}
	
	ds_list_copy(OldInputs, CurrentInputs);
	}
