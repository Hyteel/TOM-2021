function sPacketReceptionC(ScBuffer){
	var MsgType = buffer_read(ScBuffer, buffer_u8);
	
	
	switch(MsgType)
	{
		case Network.ReceiveInputOtP:
			global.InstOtPlayer.ovarLastInput = buffer_read(ScBuffer, buffer_u8);
			break;
		
		case Network.ConfirmInput:
			global.InstLocalPlayer.ovarLastInput = buffer_read(ScBuffer, buffer_u8)	;
			break;
			
		case Network.ConfirmConnect:
			global.InstMain.Identification = buffer_read(ScBuffer, buffer_u8);
			break;
			
		case Network.GlobalizePos:
			global.InstOtPlayer.LagX = buffer_read(ScBuffer, buffer_u16) - global.InstOtPlayer.x;
			global.InstOtPlayer.LagY = buffer_read(ScBuffer, buffer_u16) - global.InstOtPlayer.y;
			global.InstLocalPlayer.LagX = buffer_read(ScBuffer, buffer_u16 - global.InstLocalPlayer.x);	
			global.InstLocalPlayer.LagY = buffer_read(ScBuffer, buffer_u16 - global.InstLocalPlayer.y);
			break;
			
	}
	
}