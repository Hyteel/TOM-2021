if ((InputRequestP2OtP) && (InputRequestP1Loc))
	{
	if (CurrentStoredInputP1 == OldStoredInputP1)
		{
		P1WaitingForNew = true;
		}
	else
		{
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
	
if ((InputRequestP1OtP) && (InputRequestP2Loc))
	{
	if (CurrentStoredInputP2 == OldStoredInputP2)
		{
		P2WaitingForNew = true;
		}
	else
		{
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

//show_debug_message(string(InputRequestP1Loc) + string(InputRequestP2Loc) + string(InputRequestP1OtP) + string(InputRequestP2OtP));
