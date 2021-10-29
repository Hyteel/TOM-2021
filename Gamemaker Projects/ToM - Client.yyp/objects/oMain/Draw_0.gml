//Draw Both player input
draw_set_font(fMain);
draw_set_color(c_aqua);
draw_text(room_width/12,  (room_height/12)*4, "CurrentHoldArrayTime LOC: " + string(global.InstLocalPlayer.CurrentHeldArrayTime));
draw_text(room_width/12,  (room_height/12)*3, "CurrentHoldArrayTime OTP: " + string(global.InstOtPlayer.CurrentHeldArrayTime));
draw_set_color(c_red);
draw_text(room_width/4, (room_height/6)*2.5, "ConnectedTimeServer : " + string(ConnectedTimeServer));
draw_set_color(c_white);
draw_text((room_width/4)*3,  (room_height/6)*2, "ID : " + string(Identification));
draw_text((room_width/8)*6,  (room_height/12)*5, "ReadyForInp OTP : " + string(global.InstOtPlayer.ReadyForInput));
draw_text((room_width/8)*6,  (room_height/6)*3, "ReadyForInp LOC : " + string(global.InstLocalPlayer.ReadyForInput));
draw_set_color(c_orange)
draw_text(room_width/4, (room_height/6)*4, "Pos Localhost : " + string(oLocalPlayer.x) + " , " + string(oLocalPlayer.y));
draw_text(room_width/4, (room_height/6)*5, "Pos OtP : " + string(oOtPlayer.x) + " , " + string(oOtPlayer.y));
draw_text(room_width/4, (room_height/12)*11, "Difference : " + string(ConnectedTimeDifference));
draw_text(room_width/4, (room_height/12)*9, "CurrentTime : " + string(get_timer()));
draw_set_color(c_white)
draw_text((room_width/4)*3, (room_height/6)*5, "Key : " + string(keyboard_key));
draw_text((room_width/4)*2.5, (room_height/6)*4, "ConnectedTime : " + string(ConnectedTime));
draw_text((room_width/4)*2.5, (room_height/12)*3, "CombinedTime : " + string(get_timer() + ConnectedTimeDifference));
draw_set_color(c_olive);
draw_text(room_width/4, (room_height/12)*1, "OtP LagX : " + string(global.InstOtPlayer.LagX));
draw_text(room_width/4, (room_height/12)*2, "OtP LagY : " + string(global.InstOtPlayer.LagY));
draw_text((room_width/4)*3, (room_height/12)*1, "Local LagX : " + string(global.InstLocalPlayer.LagX));
draw_text((room_width/4)*3, (room_height/12)*2, "Local LagY : " + string(global.InstLocalPlayer.LagY));