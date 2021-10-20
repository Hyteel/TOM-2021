//Draw Both player input
draw_set_font(fMain);
draw_set_color(c_aqua);
draw_text(room_width/4,  (room_height/6)*2, "OtPTime : ");
draw_set_color(c_red);
draw_text(room_width/4, (room_height/6)*3, "CurrentTime : " + string(global.LocalTime - Sendofftime));
draw_set_color(c_white);
draw_text((room_width/4)*3,  (room_height/6)*2, "ID : " + string(Identification));
draw_set_color(c_orange)
draw_text(room_width/4, (room_height/6)*4, "Pos Localhost : " + string(oLocalPlayer.x) + " , " + string(oLocalPlayer.y));
draw_text(room_width/4, (room_height/6)*5, "Pos OtP : " + string(oOtPlayer.x) + " , " + string(oOtPlayer.y));
draw_set_color(c_white)
draw_text((room_width/4)*3, (room_height/6)*5, "Key : " + string(keyboard_key));
draw_text((room_width/4)*3, (room_height/6)*4, "CurrentTime : ");
draw_set_color(c_olive);
draw_text(room_width/4, (room_height/12)*1, "OtP LagX : " + string(global.InstOtPlayer.LagX));
draw_text(room_width/4, (room_height/12)*2, "OtP LagY : " + string(global.InstOtPlayer.LagY));
draw_text((room_width/4)*3, (room_height/12)*1, "Local LagX : " + string(global.InstLocalPlayer.LagX));
draw_text((room_width/4)*3, (room_height/12)*2, "Local LagY : " + string(global.InstLocalPlayer.LagY));