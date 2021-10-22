function scPacketReceptionC(ScBuffer){
	var MsgType = buffer_read(ScBuffer, buffer_u8);
	
	
	switch(MsgType)
	{
		case Network.SendCurrentInput:
			CommandCount = buffer_read(ScBuffer, buffer_u8);
			if (CommandCount != 0)
				{
				ds_list_clear(global.InstOtPlayer.ActiveCommands);
				for (var i = 0; i < CommandCount; i++)
					{
					ds_list_add(global.InstOtPlayer.ActiveCommands, buffer_read(ScBuffer, buffer_u8));		
					}
				}
			else
				{
				ds_list_clear(global.InstOtPlayer.ActiveCommands);
				ds_list_add(global.InstOtPlayer.ActiveCommands, PCommands.NoInput);	
				}
			break;
		
		
		case Network.ConfirmInput:
			global.LocalTime = get_timer();
			CommandCount = buffer_read(ScBuffer, buffer_u8);
			if (CommandCount != 0)
				{
				ds_list_clear(global.InstLocalPlayer.ActiveCommands);
				for (var i = 0; i < CommandCount; i++)
					{
					ds_list_add(global.InstLocalPlayer.ActiveCommands, buffer_read(ScBuffer, buffer_u8));		
					}
				}
			else
				{
				ds_list_clear(global.InstLocalPlayer.ActiveCommands);
				ds_list_add(global.InstLocalPlayer.ActiveCommands, PCommands.NoInput);	
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