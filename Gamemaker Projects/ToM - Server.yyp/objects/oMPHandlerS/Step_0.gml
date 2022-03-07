if ((InputRequestP2OtP) && (InputRequestP1Loc))
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
	network_send_packet(SocketList[0], ServerBuffer, buffer_tell(ServerBuffer));
	network_send_packet(SocketList[1], ServerBufferSameSend, buffer_tell(ServerBufferSameSend));
	}
	
if ((InputRequestP1OtP) && (InputRequestP2Loc))
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
	network_send_packet(SocketList[1], ServerBuffer, buffer_tell(ServerBuffer));
	network_send_packet(SocketList[0], ServerBufferSameSend, buffer_tell(ServerBufferSameSend));
	}	
