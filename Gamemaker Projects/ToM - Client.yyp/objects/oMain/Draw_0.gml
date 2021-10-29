//Draw Both player input
if (DebugMode == 0)
{
draw_set_font(fMain);
draw_set_color(c_aqua);
draw_text(room_width/12,  (room_height/12)*4, "CurrentHoldArrayTime LOC: " + string(global.InstLocalPlayer.CurrentHeldArrayTime));
draw_text(room_width/12,  (room_height/12)*3, "CurrentHoldArrayTime OTP: " + string(global.InstOtPlayer.CurrentHeldArrayTime));
draw_set_color(c_red);
draw_text(room_width/4, (room_height/6)*2.5, "ConnectedTimeServer : " + string(ConnectedTimeServer));
draw_set_color(c_white);
draw_text((room_width/4)*3,  (room_height/6)*2, "ID : " + string(Identification));
draw_text((room_width/8)*6,  (room_height/12)*5, "CurComPos OTP : " + string(global.InstOtPlayer.CurrentCommandPosition));
draw_text((room_width/8)*6,  (room_height/6)*3, "CurComPos LOC : " + string(global.InstLocalPlayer.CurrentCommandPosition));
draw_set_color(c_orange)
draw_text(room_width/4, (room_height/6)*4, "Pos Localhost : " + string(oLocalPlayer.x) + " , " + string(oLocalPlayer.y));
draw_text(room_width/4, (room_height/6)*5, "Pos OtP : " + string(oOtPlayer.x) + " , " + string(oOtPlayer.y));
draw_text(room_width/4, (room_height/12)*11, "Difference : " + string(ConnectedTimeDifference));
draw_text(room_width/4, (room_height/12)*9, "CurrentTime : " + string(get_timer()));
draw_set_color(c_white)
//draw_text((room_width/4)*3, (room_height/6)*5, "Key : " + string(keyboard_key));
draw_text((room_width/4)*2.5, (room_height/6)*4, "ConnectedTime : " + string(ConnectedTime));
draw_text((room_width/8)*5,  (room_height/12)*9, "CurComInx OTP : " + string(global.InstOtPlayer.CurrentCommandIndex));
draw_text((room_width/8)*5,  (room_height/12)*10, "CurComInx LOC : " + string(global.InstLocalPlayer.CurrentCommandIndex));
draw_text((room_width/4)*2.5, (room_height/12)*3, "CombinedTime : " + string(get_timer() + ConnectedTimeDifference));
draw_set_color(c_olive);
draw_text(room_width/4, (room_height/12)*1, "OtP LagX : " + string(global.InstOtPlayer.LagX));
draw_text(room_width/4, (room_height/12)*2, "OtP LagY : " + string(global.InstOtPlayer.LagY));
draw_text((room_width/4)*3, (room_height/12)*1, "Local LagX : " + string(global.InstLocalPlayer.LagX));
draw_text((room_width/4)*3, (room_height/12)*2, "Local LagY : " + string(global.InstLocalPlayer.LagY));
}
else if (DebugMode == 1)
	{
	draw_set_color(c_aqua);
	draw_text(room_width/2.5, 0, "LOCAL PLAYER")
	for (var i = 0; i < 10; i++)
		{
		draw_text(room_width/16, (room_height/10)*i, "[ " + string(global.InstLocalPlayer.QueuedCommands[# 1, i]) + " , S:" + string(ds_list_size(global.InstLocalPlayer.QueuedCommands[# 0, i])) + " , " + string(global.InstLocalPlayer.QueuedCommands[# 0, i][| 0]) + " ]")
		}
	
	draw_set_color(c_orange);
	draw_text(room_width/2.5, room_height/10, "OT PLAYER")
	for (var i = 0; i < 10; i++)
		{
		draw_text((room_width/4)*2.5, (room_height/10)*i, "[ " + string(global.InstOtPlayer.QueuedCommands[# 1, i]) + " , S:" + string(ds_list_size(global.InstOtPlayer.QueuedCommands[# 0, i])) + " , " + string(global.InstOtPlayer.QueuedCommands[# 0, i][| 0]) + " ]")
		}
	
	draw_set_color(c_white);
	draw_text((room_width/4)*1.5, (room_height/6)*4, "CT : " + string(get_timer()));
	draw_text((room_width/4)*1.5, (room_height/6)*4.5, "CTDif : " + string(ConnectedTimeDifference));
	draw_text((room_width/4)*1.5, (room_height/6)*5, "CTTot : " + string(ConnectedTimeDifference + get_timer()));
	
	draw_text((room_width/4)*1.5, (room_height/6)*1, "CurComPos OTP : " + string(global.InstOtPlayer.CurrentCommandPosition));
	draw_text((room_width/4)*1.5, (room_height/6)*1.5, "CurComPos LOC : " + string(global.InstLocalPlayer.CurrentCommandPosition));
	draw_text((room_width/4)*1.5, (room_height/6)*2, "CurComInx OTP : " + string(global.InstOtPlayer.CurrentCommandIndex));
	draw_text((room_width/4)*1.5, (room_height/6)*2.5, "CurComInx LOC : " + string(global.InstLocalPlayer.CurrentCommandIndex));
	}