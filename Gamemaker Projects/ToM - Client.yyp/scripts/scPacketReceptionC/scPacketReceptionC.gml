function scPacketReceptionC(ScBuffer){
	var MsgType = buffer_read(ScBuffer, buffer_u8);
	
	
	switch(MsgType)
	{
		case Network.SendCurrentInput:
			var Player = buffer_read(ScBuffer, buffer_bool);
			var TimeToExecute = buffer_read(ScBuffer, buffer_u16)*10000;
			var CombineArray = 0;
			CombineArray[0] = TimeToExecute;
			CombineArray[1] = buffer_read(ScBuffer, buffer_u8);
			
			if (Player) { ds_queue_enqueue(global.InstLocalPlayer.CommandQueue, CombineArray); }
			else { ds_queue_enqueue(global.InstOtPlayer.CommandQueue, CombineArray); }
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