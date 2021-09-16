function sPacketReception(ScBuffer, ScSocket) {
	MsgType = buffer_read(ScBuffer, buffer_u8);


	switch (MsgType)
	{
		case Network.ReceiveInputOtP:
			var Input = buffer_read(ScBuffer, buffer_string);
			buffer_seek(ServerBuffer, buffer_seek_start, 0);
			buffer_write(ServerBuffer, buffer_u8, Network.ReceiveInputOtP);
			buffer_write(ServerBuffer, buffer_string, Input);
			network_send_packet(PlayerSockets[| sGetOppositePlayer(ScSocket, PlayerSockets)], ServerBuffer, buffer_tell(ServerBuffer));
			break;
	}


}
