function scPacketReceptionC(ScBuffer){
	var MsgType = buffer_read(ScBuffer, buffer_u8);
	
	
	switch(MsgType)
	{
		case Network.SendCurrentInput:
			var CommandCount = buffer_read(ScBuffer, buffer_u8);
			global.InstOtPlayer.QueuedCommands[# 1, global.InstOtPlayer.CurrentCommandIndex] = buffer_read(ScBuffer, buffer_u16)*100000;
			if (CommandCount != 0)
				{
				ds_list_clear(global.InstOtPlayer.QueuedCommands[# 0, global.InstOtPlayer.CurrentCommandIndex]);
				for (var i = 0; i < CommandCount; i++)
					{
					ds_list_add(global.InstOtPlayer.QueuedCommands[# 0, global.InstOtPlayer.CurrentCommandIndex], buffer_read(ScBuffer, buffer_u8));		
					}
				}
			else
				{
				ds_list_clear(global.InstOtPlayer.QueuedCommands[# 0, global.InstOtPlayer.CurrentCommandIndex]);
				ds_list_add(global.InstOtPlayer.QueuedCommands[# 0, global.InstOtPlayer.CurrentCommandIndex], PCommands.NoInput);	
				}
			
			if (global.InstOtPlayer.CurrentCommandIndex >= 10) {global.InstOtPlayer.CurrentCommandIndex = 0;}
			else {global.InstOtPlayer.CurrentCommandIndex++;}
			
			break;
		
		
		case Network.ConfirmInput:
			var CommandCount = buffer_read(ScBuffer, buffer_u8);
			global.InstLocalPlayer.QueuedCommands[# 1, global.InstLocalPlayer.CurrentCommandIndex] = buffer_read(ScBuffer, buffer_u16)*100000;
			if (CommandCount != 0)
				{
				ds_list_clear(global.InstLocalPlayer.QueuedCommands[# 0, global.InstLocalPlayer.CurrentCommandIndex]);
				for (var i = 0; i < CommandCount; i++)
					{
					ds_list_add(global.InstLocalPlayer.QueuedCommands[# 0, global.InstLocalPlayer.CurrentCommandIndex], buffer_read(ScBuffer, buffer_u8));		
					}
				}
			else
				{
				ds_list_clear(global.InstLocalPlayer.QueuedCommands[# 0, global.InstLocalPlayer.CurrentCommandIndex]);
				ds_list_add(global.InstLocalPlayer.QueuedCommands[# 0, global.InstLocalPlayer.CurrentCommandIndex], PCommands.NoInput);	
				}
				
			if (global.InstLocalPlayer.CurrentCommandIndex >= 10) {global.InstLocalPlayer.CurrentCommandIndex = 0;}
			else {global.InstLocalPlayer.CurrentCommandIndex++;}
			
			break;
		
		case Network.ConfirmConnect:
			global.InstMain.Identification = buffer_read(ScBuffer, buffer_u8);
			global.InstMain.ConnectedTimeServer = buffer_read(ScBuffer, buffer_u32)*1000;
			global.InstMain.ConnectedTime = get_timer();
			global.InstMain.ConnectedTimeDifference = global.InstMain.ConnectedTimeServer - global.InstMain.ConnectedTime;
			break;
		
		
		case Network.GlobalizePos:
			global.InstOtPlayer.LagX = buffer_read(ScBuffer, buffer_u16) - global.InstOtPlayer.x;
			global.InstOtPlayer.LagY = buffer_read(ScBuffer, buffer_u16) - global.InstOtPlayer.y;
			global.InstLocalPlayer.LagX = buffer_read(ScBuffer, buffer_u16) - global.InstLocalPlayer.x;	
			global.InstLocalPlayer.LagY = buffer_read(ScBuffer, buffer_u16) - global.InstLocalPlayer.y;
			break;
			
	}
	
}