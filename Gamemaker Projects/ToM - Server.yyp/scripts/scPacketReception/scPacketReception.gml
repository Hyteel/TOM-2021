function scPacketReception(ScBuffer, ScSocket) {
	MsgType = buffer_read(ScBuffer, buffer_u8);

	switch (MsgType)
	{
		case Network.SendCurrentInput:
			var Extratime = 2;
			if (ds_list_size(PlayerSockets) > 1)
				{
				var StoredInput = buffer_read(ScBuffer, buffer_u8);
				show_debug_message("INPUT " + string(StoredInput));
				if (ScSocket == 1) 
					{
					CurrentStoredInputP1 = StoredInput; 
					if (P1WaitingForNew)
						{
						//show_debug_message("WaitingForNew P1");
						buffer_seek(ServerBuffer, buffer_seek_start, 0);
						buffer_write(ServerBuffer, buffer_u8, Network.SendCurrentInput);
						buffer_write(ServerBuffer, buffer_bool, false);
					
						buffer_seek(ServerBufferSameSend, buffer_seek_start, 0);
						buffer_write(ServerBufferSameSend, buffer_u8, Network.SendCurrentInput);
						buffer_write(ServerBufferSameSend, buffer_bool, true);
						
						buffer_write(ServerBuffer, buffer_u8, CurrentStoredInputP1);		
						buffer_write(ServerBufferSameSend, buffer_u8, CurrentStoredInputP1);	
						
						//Sendoff
						network_send_packet(PlayerSockets[|1], ServerBuffer, buffer_tell(ServerBuffer));
						network_send_packet(PlayerSockets[|0], ServerBufferSameSend, buffer_tell(ServerBufferSameSend));
						show_debug_message("SendCurrentInput Client" + string(CurrentStoredInputP1));
						InputRequestP2OtP = false;
						InputRequestP1Loc = false;
						OldStoredInputP1 = CurrentStoredInputP1;
						}
					}
				else 
					{
					CurrentStoredInputP2 = StoredInput; 
					if (P2WaitingForNew)
						{
						//show_debug_message("WaitingForNew P2");
						buffer_seek(ServerBuffer, buffer_seek_start, 0);
						buffer_write(ServerBuffer, buffer_u8, Network.SendCurrentInput);
						buffer_write(ServerBuffer, buffer_bool, false);
									
						buffer_seek(ServerBufferSameSend, buffer_seek_start, 0);
						buffer_write(ServerBufferSameSend, buffer_u8, Network.SendCurrentInput);
						buffer_write(ServerBufferSameSend, buffer_bool, true);
						
						buffer_write(ServerBuffer, buffer_u8, CurrentStoredInputP2);		
						buffer_write(ServerBufferSameSend, buffer_u8, CurrentStoredInputP2);	
						
						//Sendoff
						network_send_packet(PlayerSockets[|0], ServerBuffer, buffer_tell(ServerBuffer));
						network_send_packet(PlayerSockets[|1], ServerBufferSameSend, buffer_tell(ServerBufferSameSend));
						//show_debug_message("SendCurrentInput Client" + string(CurrentStoredInputP2));
						InputRequestP1OtP = false;
						InputRequestP2Loc = false;
						OldStoredInputP2 = CurrentStoredInputP2;
						}
					}
				//show_debug_message("SENDCURRENTINPUT " + string(StoredInput));
				
				}
			break;
		
		
		case Network.SendRequestInput:
			var PlayerId = buffer_read(ScBuffer, buffer_u8);
			if (ScSocket == 1) 
				{ 
				if (PlayerId == 0) {InputRequestP1OtP = true; }
				else {InputRequestP1Loc = true; } 
				}
			else 
				{
				if (PlayerId == 0) {InputRequestP2OtP = true; }
				else {InputRequestP2Loc = true; } 
				}
			//show_debug_message("SendRequestInput " + string(PlayerId) + ", " + "SOCKET " + string(ScSocket));
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
