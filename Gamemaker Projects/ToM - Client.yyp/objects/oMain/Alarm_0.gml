show_debug_message(Identification);
if (Identification == 1)
	{
	buffer_seek(global.ClientBuffer, buffer_seek_start, 0);
	buffer_write(global.ClientBuffer, buffer_u8, Network.GlobalizePos);
	buffer_write(global.ClientBuffer, buffer_u16, global.InstLocalPlayer.x);
	buffer_write(global.ClientBuffer, buffer_u16, global.InstLocalPlayer.y);
	buffer_write(global.ClientBuffer, buffer_u16, global.InstOtPlayer.x);
	buffer_write(global.ClientBuffer, buffer_u16, global.InstOtPlayer.y);
	network_send_packet(global.ClientSocket, global.ClientBuffer, buffer_tell(global.ClientBuffer));
	
	alarm[0] = room_speed*GlobaPosInter;
	}