draw_set_font(fMain);
draw_set_color(c_aqua);
if (ds_list_size(PlayerSockets) > 0) { draw_text(room_width/4, (room_height/6)*2,  "Player1 : " + string(PlayerSockets[| 0])); } else {draw_text(room_width/4, (room_height/6)*2, "Player1 : " + "NOT CONNECTED"); }
draw_set_color(c_red);
if (ds_list_size(PlayerSockets) > 1) { draw_text(room_width/4, (room_height/6)*3,  "Player2 : " + string(PlayerSockets[| 1])); } else {draw_text(room_width/4, (room_height/6)*3, "Player2 : " + "NOT CONNECTED"); }
