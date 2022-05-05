// Camera
var DistanceModifier = clamp((abs(oLocalPlayer.x - oOtPlayer.x) + abs(oLocalPlayer.y - oOtPlayer.y)) / 2000, 0, 0.35) + 1;
var CurrentWidth = MinWidth * DistanceModifier;
var CurrentHeight = MinHeight * DistanceModifier;
var CameraPosX = clamp(oLocalPlayer.x, CurrentWidth/2, room_width - CurrentWidth/2 - 5);
var CameraPosY = clamp(oLocalPlayer.y, CurrentHeight/2, room_height - CurrentHeight/2);
var ViewMat = matrix_build_lookat(CameraPosX, CameraPosY, -10, CameraPosX, CameraPosY, 0, 0, 1, 0);
var ProjMat = matrix_build_projection_ortho(CurrentWidth, CurrentHeight, 1.0, 3200.0);
camera_set_view_mat(view_camera[0], ViewMat);
camera_set_proj_mat(view_camera[0], ProjMat)
var ViewMat = matrix_build_lookat(CameraPosX, CameraPosY, -10, CameraPosX, CameraPosY, 0, 0, 1, 0);
camera_set_view_mat(view_camera[0], ViewMat);