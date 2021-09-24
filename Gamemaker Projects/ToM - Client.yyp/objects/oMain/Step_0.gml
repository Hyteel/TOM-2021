//Input
if ((keyboard_check(vk_anykey)) && (LastInput != keyboard_key))
	{
	LastInput = keyboard_key;	
	buffer_seek(global.ClientBuffer, buffer_seek_start, 0);
	buffer_write(global.ClientBuffer, buffer_u8, Network.ReceiveInputOtP);
	buffer_write(global.ClientBuffer, buffer_u8, LastInput);
	network_send_packet(global.ClientSocket, global.ClientBuffer, buffer_tell(global.ClientBuffer));
	}

if ((keyboard_key == 0) && (LastInput != -1))
	{
	LastInput = -1;
	buffer_seek(global.ClientBuffer, buffer_seek_start, 0);
	buffer_write(global.ClientBuffer, buffer_u8, Network.ReceiveInputOtP);
	buffer_write(global.ClientBuffer, buffer_u8, 0);
	network_send_packet(global.ClientSocket, global.ClientBuffer, buffer_tell(global.ClientBuffer));
	}
	
