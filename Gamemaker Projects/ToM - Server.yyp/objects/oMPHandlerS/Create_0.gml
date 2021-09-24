//Initialization
global.Port = 25565;
CurrentSocket = "";
EventType = "";
PlayerSockets = ds_list_create();


//Networking
ServerSocket = network_create_server(network_socket_tcp, global.Port, 2);
ServerBuffer = buffer_create(1024, buffer_fixed, 1);

//Enum
enum Network
{
	ReceiveInputOtP,
	ConfirmInput,
	ConfirmConnect,
	GlobalizePos
}
