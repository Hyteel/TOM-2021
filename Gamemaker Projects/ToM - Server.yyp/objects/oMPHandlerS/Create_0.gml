//Initialization
global.Port = 25565;
CurrentSocket = "";
EventType = "";
PlayerSockets = ds_list_create();


//Networking
ServerSocket = network_create_server(network_socket_tcp, global.Port, 2);
ServerBuffer = buffer_create(16, buffer_grow, 1);
ServerBufferSameSend = buffer_create(16, buffer_grow, 1);
CurrentStoredInputP1 = 0;
CurrentStoredInputP2 = 0;
InputRequestP1Loc = false;
InputRequestP2Loc = false;
InputRequestP1OtP = false;
InputRequestP2OtP = false;

//Enum
enum Network
{
	SendCurrentInput,
	ConfirmConnect,
	GlobalizePos,
	SendAttack,
	SendRequestInput
}
