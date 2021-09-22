//Draw Both player input
draw_set_font(fMain);
draw_set_color(c_aqua);
draw_text(room_width/4,  (room_height/6)*2, "LocalhostInput : " + string(global.InstLocalPlayer.ovarLastInput));
draw_set_color(c_red);
draw_text(room_width/4, (room_height/6)*3, "OtherPlayerInput : " + string(global.InstOtPlayer.ovarLastInput));
