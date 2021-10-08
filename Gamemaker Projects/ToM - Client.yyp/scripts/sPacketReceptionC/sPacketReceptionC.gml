function sPacketReceptionC(ScBuffer){
	var MsgType = buffer_read(ScBuffer, buffer_u8);
	
	
	switch(MsgType)
	{
		case Network.SendCurrentInput:
			show_debug_message("ERROR AT SENCDUCCRENTINPUT");
			CommandCount = buffer_read(ScBuffer, buffer_u8);
			if (CommandCount != 0)
				{
				for (var i = 0; i = CommandCount; i++)
					{
					show_debug_message("I-NUMBER: " + i);
					ds_list_add(global.InstOtPlayer.ActiveCommands, buffer_read(ScBuffer, buffer_u8));		
					}
				}
			break;
		
		
		case Network.ConfirmInput:
			show_debug_message("ERROR AT CONFIRMINPUT");
			CommandCount = buffer_read(ScBuffer, buffer_u8);
			show_debug_message("GOT PAST COMMANDCOUNT");
			if (CommandCount != 0)
				{
				for (var i = 0; i = CommandCount; i++)
					{
					show_debug_message("I-NUMBER: " + i);
					ds_list_add(global.InstLocalPlayer.ActiveCommands, buffer_read(ScBuffer, buffer_u8));		
					}
				}
			break;
		
		
		case Network.ConfirmConnect:
			global.InstMain.Identification = buffer_read(ScBuffer, buffer_u8);
			break;
		
		
		case Network.GlobalizePos:
			global.InstOtPlayer.LagX = buffer_read(ScBuffer, buffer_u16) - global.InstOtPlayer.x;
			global.InstOtPlayer.LagY = buffer_read(ScBuffer, buffer_u16) - global.InstOtPlayer.y;
			global.InstLocalPlayer.LagX = buffer_read(ScBuffer, buffer_u16) - global.InstLocalPlayer.x;	
			global.InstLocalPlayer.LagY = buffer_read(ScBuffer, buffer_u16) - global.InstLocalPlayer.y;
			break;
			
	}
	
}