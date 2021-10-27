EventType = ds_map_find_value(async_load, "type");

switch(EventType)
{
	case network_type_data:
		var Buffer = ds_map_find_value(async_load, "buffer")
		buffer_seek(Buffer, buffer_seek_start, 0);
		scPacketReceptionC(Buffer);
		break;
}