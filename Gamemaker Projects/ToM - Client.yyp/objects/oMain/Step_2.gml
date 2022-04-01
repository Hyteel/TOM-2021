// Camera
var ViewMat = matrix_build_lookat(oLocalPlayer.x, oLocalPlayer.y, -10, oLocalPlayer.x, oLocalPlayer.y, 0, 0, 1, 0);
var ProjMat = matrix_build_projection_ortho(1024/1.5, 768/1.5, 1.0, 3200.0);
camera_set_view_mat(view_camera[0], ViewMat);
camera_set_proj_mat(view_camera[0], ProjMat)
