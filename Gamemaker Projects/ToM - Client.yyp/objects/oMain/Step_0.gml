//New Input sys
sInputCheck(37, PCommands.MoveLeft);
sInputCheck(38, PCommands.MoveUp);
sInputCheck(39, PCommands.MoveRight);
sInputCheck(40, PCommands.MoveDown);

var Size = ds_list_size(CurrentInputs);

if (!(sListCompare(OldInputs, CurrentInputs)) && (Size != 0))
	{
	buffer_seek(global.ClientBuffer, buffer_seek_start, 0);
	buffer_write(global.ClientBuffer, buffer_u8, Network.SendCurrentInput);
	buffer_write(global.ClientBuffer, buffer_u8, Size);
	for (var i = 0; i == Size; i++)
		{
		buffer_write(global.ClientBuffer, buffer_u8, CurrentInputs[i]);
		}
	network_send_packet(global.ClientSocket, global.ClientBuffer, buffer_tell(global.ClientBuffer));
	ds_list_copy(OldInputs, CurrentInputs);
	}