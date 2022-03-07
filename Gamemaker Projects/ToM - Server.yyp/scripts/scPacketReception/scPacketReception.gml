function scPacketReception(ScBuffer, ScSocket) {
	MsgType = buffer_read(ScBuffer, buffer_u8);

	switch (MsgType)
	{
		case Network.SendCurrentInput:
			var Extratime = 2;
			if (ds_list_size(PlayerSockets) > 1)
				{
				/*//Dual Buffers	
				var Input = buffer_read(ScBuffer, buffer_u8);
				var CurrentTime = get_timer();
				var TimeToSet = floor(CurrentTime/10000) + Extratime;
					
				buffer_seek(ServerBuffer, buffer_seek_start, 0);
				buffer_write(ServerBuffer, buffer_u8, Network.SendCurrentInput);
				buffer_write(ServerBuffer, buffer_bool, false);
				buffer_write(ServerBuffer, buffer_u16, TimeToSet);
					
				buffer_seek(ServerBufferSameSend, buffer_seek_start, 0);
				buffer_write(ServerBufferSameSend, buffer_u8, Network.SendCurrentInput);
				buffer_write(ServerBufferSameSend, buffer_bool, true);
				buffer_write(ServerBufferSameSend, buffer_u16, TimeToSet);
					
				buffer_write(ServerBuffer, buffer_u8, Input);		
				buffer_write(ServerBufferSameSend, buffer_u8, Input);	
					
						
				//Sendoff
				var SameSendSocket = PlayerSockets[| scGetOppositePlayer(ScSocket, PlayerSockets)];
				network_send_packet(SameSendSocket, ServerBuffer, buffer_tell(ServerBuffer));
				network_send_packet(ScSocket, ServerBufferSameSend, buffer_tell(ServerBufferSameSend));	*/
				
				if (ScSocket == 0) {CurrentStoredInputP1 = buffer_read(ScBuffer, buffer_u8); }
				else {CurrentStoredInputP2 = buffer_read(ScBuffer, buffer_u8); }
				
				}
			break;
		
		
		case Network.SendRequestInput:
			if (ScSocket == 0) 
				{ 
				if (buffer_read(ScBuffer, buffer_u8) == 0) {InputRequestP1OtP = true; }
				else {InputRequestP1Loc = true; } 
				}
			else 
				{
				if (buffer_read(ScBuffer, buffer_u8) == 0) {InputRequestP2OtP = true; }
				else {InputRequestP2Loc = true; } 
				}
			break;
		
			
		case Network.SendAttack:
			var Extratime = 2;
			if (ds_list_size(PlayerSockets) > 1)
				{
				//Dual Buffers	
				var Input = buffer_read(ScBuffer, buffer_u8);
				var CurrentTime = get_timer();
				var TimeToSet = floor(CurrentTime/10000) + Extratime;
				var Damage = buffer_read(ScBuffer, buffer_u8);
					
				buffer_seek(ServerBuffer, buffer_seek_start, 0);
				buffer_write(ServerBuffer, buffer_u8, Network.SendAttack);
				buffer_write(ServerBuffer, buffer_bool, true);
				buffer_write(ServerBuffer, buffer_u16, TimeToSet);
					
				buffer_seek(ServerBufferSameSend, buffer_seek_start, 0);
				buffer_write(ServerBufferSameSend, buffer_u8, Network.SendAttack);
				buffer_write(ServerBufferSameSend, buffer_bool, false);
				buffer_write(ServerBufferSameSend, buffer_u16, TimeToSet);
					
				buffer_write(ServerBuffer, buffer_u8, Input);		
				buffer_write(ServerBufferSameSend, buffer_u8, Input);	
				
				buffer_write(ServerBuffer, buffer_u8, Damage);
				buffer_write(ServerBufferSameSend, buffer_u8, Damage);
				
						
				//Sendoff
				var SameSendSocket = PlayerSockets[| scGetOppositePlayer(ScSocket, PlayerSockets)];
				network_send_packet(SameSendSocket, ServerBuffer, buffer_tell(ServerBuffer));
				network_send_packet(ScSocket, ServerBufferSameSend, buffer_tell(ServerBufferSameSend));	
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
