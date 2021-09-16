//Initialization
Port = 25565;
MaxClients = 2;
CurrentSocket = "";
EventType = "";
PlayerSockets = ds_list_create();


//Networking
ServerSocket = network_create_server(network_socket_tcp, global.Port, global.MaxClients);
ServerBuffer = buffer_create(1024, buffer_fixed, 1);

