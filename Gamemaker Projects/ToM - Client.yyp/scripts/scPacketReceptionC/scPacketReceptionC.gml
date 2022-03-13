function scPacketReceptionC(ScBuffer){
	var MsgType = buffer_read(ScBuffer, buffer_u8);
	
	
	switch(MsgType)
	{
		case Network.SendCurrentInput:
			var Player = buffer_read(ScBuffer, buffer_bool);
			var Input = buffer_read(ScBuffer, buffer_u8);
			var RecivedTime = get_timer();
			
			var File = file_text_open_append(working_directory + "\Inputs" + string(Player) + "RecivedInputs" + ".txt");
			var StringToWrite = string(get_timer() +  global.InstMain.ConnectedTimeDifference) + " " + string(Input) + "\n";
			file_text_write_string(File, StringToWrite);
			file_text_close(File);
			
			if (Player) 
				{  
				global.InstLocalPlayer.ActiveCommand = Input;
				global.InstLocalPlayer.HasSentRequest = false;
				global.InstLocalPlayer.NextAnimTime = RecivedTime;
				}
			else 
				{
				global.InstOtPlayer.ActiveCommand = Input;
				global.InstOtPlayer.HasSentRequest = false;
				global.InstOtPlayer.NextAnimTime = RecivedTime;
				}
				
			break;
			
			
		case Network.SendAttack:
			show_debug_message("RECIVEDSENDATTACK");
			var Player = buffer_read(ScBuffer, buffer_bool);
			var TimeToExecute = buffer_read(ScBuffer, buffer_u16)*10000;
			var CombineArray = 0;
			CombineArray[0] = TimeToExecute;
			CombineArray[1] = buffer_read(ScBuffer, buffer_u8) + 1000;
			CombineArray[2] = buffer_read(ScBuffer, buffer_u8);
			
			if (Player) {  ds_queue_enqueue(global.InstLocalPlayer.CommandQueue, CombineArray); }
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