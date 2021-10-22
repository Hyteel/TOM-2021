EventType = ds_map_find_value(async_load, "type");


switch (EventType) 
{
	case network_type_connect:
		CurrentSocket = ds_map_find_value(async_load, "socket");
		ds_list_add(PlayerSockets, CurrentSocket);
		buffer_seek(ServerBuffer, buffer_seek_start, 0);
		buffer_write(ServerBuffer, buffer_u8, Network.ConfirmConnect);
		buffer_write(ServerBuffer, buffer_u8, CurrentSocket);
		network_send_packet(CurrentSocket, ServerBuffer, buffer_tell(ServerBuffer));
		break;
		
	case network_type_disconnect:
		CurrentSocket = ds_map_find_value(async_load, "socket");
		ds_list_delete(PlayerSockets, ds_list_find_index(PlayerSockets, CurrentSocket));
		break;
	
	case network_type_data:
		Buffer = ds_map_find_value(async_load, "buffer");
		CurrentSocket = ds_map_find_value(async_load, "id");
		buffer_seek(Buffer, buffer_seek_start, 0);
		scPacketReception(Buffer, CurrentSocket);
		break;


}