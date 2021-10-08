//Initialization
Port = 25565
network_set_config(network_config_connect_timeout, 1000);

//Networking
global.ClientSocket = network_create_socket(network_socket_tcp);
Server = network_connect(global.ClientSocket, "127.0.0.1", Port);

global.ClientBuffer = buffer_create(1024, buffer_fixed, 1);

if (Server >= 0)
    show_debug_message("Connected");
else
    game_end();

//Network Commands
enum Network
{
	SendCurrentInput,
	ConfirmInput,
	ConfirmConnect,
	GlobalizePos
}

//Player Commands
enum PCommands
{
	MoveLeft,
	MoveRight,
	MoveDown,
	MoveUp


}


//Instances
global.InstMain = instance_create_depth(0, 0, 0, oMain);
global.InstLocalPlayer = instance_create_depth(0, 0, 0, oLocalPlayer);
global.InstOtPlayer = instance_create_depth(0, 0, 0, oOtPlayer);