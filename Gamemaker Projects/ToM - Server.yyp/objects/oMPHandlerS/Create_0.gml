//Initialization
global.Port = 25565;
CurrentSocket = "";
EventType = "";
PlayerSockets = ds_list_create();


//Networking
ServerSocket = network_create_server(network_socket_tcp, global.Port, 2);
ServerBuffer = buffer_create(16, buffer_grow, 1);
ServerBufferSameSend = buffer_create(16, buffer_grow, 1);


//Enum
enum Network
{
	SendCurrentInput,
	ConfirmInput,
	ConfirmConnect,
	GlobalizePos
}
