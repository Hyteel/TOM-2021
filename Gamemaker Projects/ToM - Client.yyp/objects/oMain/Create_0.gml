//Initialization
Identification = 0;
GlobaPosInter = 5;
OldInput = 0;
Sendofftime = 0;
ConnectedTime = 0;
ConnectedTimeServer = 0;
ConnectedTimeDifference = 0;
DebugMode = 0;
RoomW = room_width/2;
RoomH = room_height/2;
OldInputTime = 0;


//Debug
LocPHead = 0;
LocPAAT = 0;
OtPHead = 0;
OtPAAT = 0;


//Resync
alarm[0] = room_speed*GlobaPosInter;


//Camera
view_enabled[0] = true;
view_camera[0] = camera_create();
var ViewMat = matrix_build_lookat(RoomW/2, RoomH/2, -10, RoomW/2, RoomH/2, 0, 0, 1, 0);
var ProjMat = matrix_build_projection_ortho(1024, 768, 1.0, 3200.0);
camera_set_view_mat(view_camera[0], ViewMat);
camera_set_proj_mat(view_camera[0], ProjMat);
