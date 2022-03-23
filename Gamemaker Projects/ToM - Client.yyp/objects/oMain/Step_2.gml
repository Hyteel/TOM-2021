// Camera
var ViewMat = matrix_build_lookat(oLocalPlayer.x, oLocalPlayer.y, -10, oLocalPlayer.x, oLocalPlayer.y, 0, 0, 1, 0);
camera_set_view_mat(view_camera[0], ViewMat);
