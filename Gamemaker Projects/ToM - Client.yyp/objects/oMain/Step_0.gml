//Input
if (keyboard_check(vk_anykey))
	{
	LastInput = keyboard_lastchar;
	buffer_seek(global.ClientBuffer, buffer_seek_start, 0);
	buffer_write(global.ClientBuffer, buffer_u8, Network.ReceiveInputOtP);
	buffer_write(global.ClientBuffer, buffer_string, LastInput);
	network_send_packet(global.ClientSocket, global.ClientBuffer, buffer_tell(global.ClientBuffer));
	}