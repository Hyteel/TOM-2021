//NEW2 INPUT SYS
var Input = scCompileInputs();

if (Input != OldInput)
	{
	show_debug_message("Sendoff");	
	buffer_seek(global.ClientBuffer, buffer_seek_start, 0);
	buffer_write(global.ClientBuffer, buffer_u8, Network.SendCurrentInput);
	buffer_write(global.ClientBuffer, buffer_u8, Input);	
	network_send_packet(global.ClientSocket, global.ClientBuffer, buffer_tell(global.ClientBuffer));
	Sendofftime = get_timer();
	OldInput = Input;
	}


if (keyboard_check_pressed(ord("P")))
	{
	if (DebugMode == 0) { DebugMode = 1}
	else {DebugMode = 0; }
	}