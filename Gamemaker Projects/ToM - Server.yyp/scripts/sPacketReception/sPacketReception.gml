function sPacketReception(ScBuffer, ScSocket) {
	MsgType = buffer_read(ScBuffer, buffer_u8);


	switch (MsgType)
	{
		case Network.ReceiveInputOtP:
			if !(ds_list_size(PlayerSockets) <= 1)
				{
				
				var Input = buffer_read(ScBuffer, buffer_u8);
				show_debug_message(Input);
				buffer_seek(ServerBuffer, buffer_seek_start, 0);
				buffer_write(ServerBuffer, buffer_u8, Network.ReceiveInputOtP);
				buffer_write(ServerBuffer, buffer_u8, Input);
				network_send_packet(PlayerSockets[| sGetOppositePlayer(ScSocket, PlayerSockets)], ServerBuffer, buffer_tell(ServerBuffer));
				
				buffer_seek(ServerBuffer, buffer_seek_start, 0);
				buffer_write(ServerBuffer, buffer_u8, Network.ConfirmInput);
				buffer_write(ServerBuffer, buffer_u8, Input);
				network_send_packet(ScSocket, ServerBuffer, buffer_tell(ServerBuffer));
				
				break;
				}
		
		
		case Network.GlobalizePos:
			{
				
			var SenderX buffer_read(ScBuffer, buffer_u16);
			var SenderY buffer_read(ScBuffer, buffer_u16);
			var ReceiverX buffer_read(ScBuffer, buffer_u16);
			var ReceiverY buffer_read(ScBuffer, buffer_u16);
			buffer_write(ServerBuffer, buffer_u8, Network.GlobalizePos);
			buffer_write(ServerBuffer, buffer_u16, SenderX);
			buffer_write(ServerBuffer, buffer_u16, SenderY);
			buffer_write(ServerBuffer, buffer_u16, ReceiverX);
			buffer_write(ServerBuffer, buffer_u16, ReceiverY);
			network_send_packet(PlayerSockets[| sGetOppositePlayer(ScSocket, PlayerSockets)], ServerBuffer, buffer_tell(ServerBuffer));
			
			break;
			}
	}


}
