EventType = ds_map_find_value(async_load, "type");


switch (EventType) 
{
	case network_type_connect:
		CurrentSocket = ds_map_find_value(async_load, "socket");
		ds_list_add(PlayerSockets, CurrentSocket);
		break;
		
	case network_type_connect:
		CurrentSocket = ds_map_find_value(async_load, "socket");
		ds_list_delete(PlayerSockets, ds_list_find_index(PlayerSockets, CurrentSocket));
		break;
	
	case network_type_data:
		Buffer = ds_map_find_value(async_load, "buffer");
		CurrentSocket = ds_map_find_value(async_load, "id");
		buffer_seek(Buffer, buffer_seek_start, 0);
		sPacketReception(Buffer, CurrentSocket);
		break;


}