//Initialization
Port = 25565


//Networking
ClientSocket = network_create_socket(network_socket_tcp);
Server = network_connect(ClientSocket, "127.0.0.1", Port);