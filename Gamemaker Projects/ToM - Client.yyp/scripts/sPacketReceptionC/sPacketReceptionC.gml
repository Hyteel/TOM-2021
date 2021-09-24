function sPacketReceptionC(ScBuffer){
	var MsgType = buffer_read(ScBuffer, buffer_u8);
	
	
	switch(MsgType)
	{
		case Network.ReceiveInputOtP:
			global.InstOtPlayer.ovarLastInput = buffer_read(ScBuffer, buffer_u8);
			break;
		
		case Network.ConfirmInput:
			global.InstLocalPlayer.ovarLastInput = buffer_read(ScBuffer, buffer_u8);
			break;
			
		case Network.ConfirmConnect:
			oMain.Identification = buffer_read(ScBuffer, buffer_u8);
			break;
	}
	
}