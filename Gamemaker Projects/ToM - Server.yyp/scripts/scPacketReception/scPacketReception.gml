function scPacketReception(ScBuffer, ScSocket) {
	MsgType = buffer_read(ScBuffer, buffer_u8);

	switch (MsgType)
	{
		case Network.SendCurrentInput:
			var Extratime = 10;
			if (ds_list_size(PlayerSockets) > 1)
				{
				var CommandCount = buffer_read(ScBuffer, buffer_u8);
				
				if (CommandCount != 0)
					{
					//Dual Buffers	
					var CurrentTime = get_timer();
					var TimeToSet = floor(CurrentTime/100000) + Extratime;
					
					buffer_seek(ServerBufferSameSend, buffer_seek_start, 0);
					buffer_write(ServerBufferSameSend, buffer_u8, Network.ConfirmInput);
					buffer_write(ServerBufferSameSend, buffer_u8, CommandCount);
					buffer_write(ServerBufferSameSend, buffer_u16, TimeToSet);
				
					buffer_seek(ServerBuffer, buffer_seek_start, 0);
					buffer_write(ServerBuffer, buffer_u8, Network.SendCurrentInput);
					buffer_write(ServerBuffer, buffer_u8, CommandCount);
					buffer_write(ServerBuffer, buffer_u16, TimeToSet);

					for (var i = 0; i < CommandCount; i++)
						{
						var CurrentBuffer = buffer_read(ScBuffer, buffer_u8);
						
						buffer_write(ServerBuffer, buffer_u8, CurrentBuffer);		
						buffer_write(ServerBufferSameSend, buffer_u8, CurrentBuffer);	
						}
						
					//Sendoff
					var SameSendSocket = PlayerSockets[| scGetOppositePlayer(ScSocket, PlayerSockets)];
					network_send_packet(SameSendSocket, ServerBuffer, buffer_tell(ServerBuffer));
					network_send_packet(ScSocket, ServerBufferSameSend, buffer_tell(ServerBufferSameSend));	
					}
				else
					{ //Case 0
					show_debug_message("Case 0");
					var CurrentTime = get_timer();
					var TimeToSet = round(CurrentTime/100000) + Extratime;
						
					buffer_seek(ServerBuffer, buffer_seek_start, 0);
					buffer_write(ServerBuffer, buffer_u8, Network.SendCurrentInput);
					buffer_write(ServerBuffer, buffer_u8, CommandCount);
					buffer_write(ServerBuffer, buffer_u16, TimeToSet);
					
					buffer_seek(ServerBufferSameSend, buffer_seek_start, 0);
					buffer_write(ServerBufferSameSend, buffer_u8, Network.ConfirmInput);
					buffer_write(ServerBufferSameSend, buffer_u8, CommandCount);
					buffer_write(ServerBufferSameSend, buffer_u16, TimeToSet);
					
					var SameSendSocket = PlayerSockets[| scGetOppositePlayer(ScSocket, PlayerSockets)];
					network_send_packet(SameSendSocket, ServerBuffer, buffer_tell(ServerBuffer));
					network_send_packet(ScSocket, ServerBufferSameSend, buffer_tell(ServerBufferSameSend));	
					}
				}
				
			break;
		
		
		case Network.GlobalizePos:
			if (ds_list_size(PlayerSockets) > 1)
			{
				buffer_seek(ServerBuffer, buffer_seek_start, 0);
				var SenderX = buffer_read(ScBuffer, buffer_u16);
				var SenderY = buffer_read(ScBuffer, buffer_u16);
				var ReceiverX = buffer_read(ScBuffer, buffer_u16);
				var ReceiverY = buffer_read(ScBuffer, buffer_u16);
			
				buffer_write(ServerBuffer, buffer_u8, Network.GlobalizePos);
				buffer_write(ServerBuffer, buffer_u16, SenderX);
				buffer_write(ServerBuffer, buffer_u16, SenderY);
				buffer_write(ServerBuffer, buffer_u16, ReceiverX);
				buffer_write(ServerBuffer, buffer_u16, ReceiverY);
				network_send_packet(PlayerSockets[| scGetOppositePlayer(ScSocket, PlayerSockets)], ServerBuffer, buffer_tell(ServerBuffer));
			}
			
			break;
	}


}
