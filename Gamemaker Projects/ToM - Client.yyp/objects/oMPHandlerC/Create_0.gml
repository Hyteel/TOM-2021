//Initialization
Port = 25565
network_set_config(network_config_connect_timeout, 1000);

//Networking
global.ClientSocket = network_create_socket(network_socket_tcp);
Server = network_connect(global.ClientSocket, "127.0.0.1", Port);
global.ClientBuffer = buffer_create(16, buffer_grow, 1);

if (Server >= 0)
    show_debug_message("Connected");
else
    game_end();


//Network Commands
enum Network
{
	SendCurrentInput,
	ConfirmConnect,
	GlobalizePos,
	SendAttack
}

//Player Commands
enum PCommands
{
	MoveLeft,
	MoveRight,
	MoveDown,
	MoveUp,
	NoInput


}

//Player Commands
enum Animations
{
	MoveLeft,
	MoveRight,
	MoveDown,
	MoveUp,
	NoInput

}

//Instances
global.InstMain = instance_create_depth(0, 0, 0, oMain);
global.InstLocalPlayer = instance_create_depth(room_width/2, 0, 0, oLocalPlayer);
global.InstOtPlayer = instance_create_depth(room_width/2, 0, 0, oOtPlayer);
global.InstOtPlayer.Id = 1;