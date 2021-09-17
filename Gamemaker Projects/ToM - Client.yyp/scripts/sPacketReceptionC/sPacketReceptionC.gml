function sPacketReceptionC(ScBuffer){
	var MsgType = buffer_read(ScBuffer, buffer_u8);
	
	
	switch(MsgType)
	{
		case Network.ReceiveInputOtP:
			global.InstMain.LastInputOtP = buffer_read(ScBuffer, buffer_u8);
			break;
	}
	
}