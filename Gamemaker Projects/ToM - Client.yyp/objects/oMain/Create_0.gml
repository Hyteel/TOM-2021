//Initialization
Identification = 0;
GlobaPosInter = 0.1;
CurrentInputs = ds_list_create();
OldInputs = ds_list_create();
Sendofftime = 0;
ConnectedTime = 0;
ConnectedTimeServer = 0;
ConnectedTimeDifference = 0;
CurrentHeldArrayTime = 0;
CurrentSentInputs = 0;
DebugMode = 0;


//Globalizer
alarm[0] = room_speed*GlobaPosInter;

