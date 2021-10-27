function scPacketReceptionC(ScBuffer){
	var MsgType = buffer_read(ScBuffer, buffer_u8);
	
	
	switch(MsgType)
	{
		case Network.SendCurrentInput:
			var CommandCount = buffer_read(ScBuffer, buffer_u8);
			global.InstMain.CurrentHeldArrayTime = buffer_read(ScBuffer, buffer_u16)*10000;
			if (CommandCount != 0)
				{
				ds_list_clear(global.InstOtPlayer.ActiveHeldCommands);
				for (var i = 0; i < CommandCount; i++)
					{
					ds_list_add(global.InstOtPlayer.ActiveHeldCommands, buffer_read(ScBuffer, buffer_u8));		
					}
				}
			else
				{
				show_debug_message("DONE");
				ds_list_clear(global.InstOtPlayer.ActiveHeldCommands);
				ds_list_add(global.InstOtPlayer.ActiveHeldCommands, PCommands.NoInput);	
				}
			break;
		
		
		case Network.ConfirmInput:
			var CommandCount = buffer_read(ScBuffer, buffer_u8);
			global.InstMain.CurrentHeldArrayTime = buffer_read(ScBuffer, buffer_u16)*10000;
			if (CommandCount != 0)
				{
				ds_list_clear(global.InstLocalPlayer.ActiveHeldCommands);
				for (var i = 0; i < CommandCount; i++)
					{
					ds_list_add(global.InstLocalPlayer.ActiveHeldCommands, buffer_read(ScBuffer, buffer_u8));		
					}
				}
			else
				{
				show_debug_message("DONE");
				ds_list_clear(global.InstLocalPlayer.ActiveHeldCommands);
				ds_list_add(global.InstLocalPlayer.ActiveHeldCommands, PCommands.NoInput);	
				}
			break;
		
		
		case Network.ConfirmConnect:
			global.InstMain.Identification = buffer_read(ScBuffer, buffer_u8);
			global.InstMain.ConnectedTimeServer = buffer_read(ScBuffer, buffer_u32)*100;
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