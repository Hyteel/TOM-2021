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
	draw_text(room_width/2.5, 0, "LOCAL PLAYER");
	if !(is_undefined(ds_queue_head(global.InstLocalPlayer.CommandQueue)))
		{
		LocPHead = "HEAD : " + string(ds_queue_head(global.InstLocalPlayer.CommandQueue)[0]) + " , " + string(ds_queue_head(global.InstLocalPlayer.CommandQueue)[1]);
		LocPHeadList = "HEAD LIST : " + string(ds_list_find_value(ds_queue_head(global.InstLocalPlayer.CommandQueue)[1], 0)) + " , " + 
		string(ds_list_find_value(ds_queue_head(global.InstLocalPlayer.CommandQueue)[1], 1)) + " , " + string(ds_list_find_value(ds_queue_head(global.InstLocalPlayer.CommandQueue)[1], 2));
		LocPAAT = "ACTIVEARRAY TIME : " + string(global.InstLocalPlayer.ActiveArray[0]);
		LocPTail = "TAIL : " + string(ds_queue_tail(global.InstLocalPlayer.CommandQueue)[0]) + " , " + string(ds_queue_tail(global.InstLocalPlayer.CommandQueue)[1]);
		LocPTailList = "TAIL LIST : " + string(ds_list_find_value(ds_queue_tail(global.InstLocalPlayer.CommandQueue)[1], 0)) + " , " + 
		string(ds_list_find_value(ds_queue_tail(global.InstLocalPlayer.CommandQueue)[1], 1)) + " , " + string(ds_list_find_value(ds_queue_tail(global.InstLocalPlayer.CommandQueue)[1], 2));
		}
	draw_text(room_width/16, room_height/10, LocPHead);
	draw_text(room_width/16, (room_height/10)*2, LocPHeadList);
	draw_text(room_width/16, (room_height/10)*3, LocPAAT);
	draw_text(room_width/16, (room_height/10)*4, LocPTail);
	draw_text(room_width/16, (room_height/10)*5, LocPTailList);
	draw_text(room_width/16, (room_height/10)*6, "LocalVerticalSpeed : " + string(global.InstLocalPlayer.VerticalSpeed));
	
	
	draw_set_color(c_orange);
	draw_text(room_width/2.5, room_height/10, "OT PLAYER");
	if !(is_undefined(ds_queue_head(global.InstOtPlayer.CommandQueue)))
		{
		OtPHead = "HEAD : " + string(ds_queue_head(global.InstOtPlayer.CommandQueue)[0]) + " , " + string(ds_queue_head(global.InstOtPlayer.CommandQueue)[1]);
		OtPHeadList = "HEAD LIST : " + string(ds_list_find_value(ds_queue_head(global.InstOtPlayer.CommandQueue)[1], 0)) + " , " + 
		string(ds_list_find_value(ds_queue_head(global.InstOtPlayer.CommandQueue)[1], 1)) + " , " + string(ds_list_find_value(ds_queue_head(global.InstOtPlayer.CommandQueue)[1], 2));
		OtPAAT = "ACTIVEARRAY TIME : " + string(global.InstOtPlayer.ActiveArray[0]);
		OtPTail = "TAIL : " + string(ds_queue_tail(global.InstOtPlayer.CommandQueue)[0]) + " , " + string(ds_queue_tail(global.InstOtPlayer.CommandQueue)[1]);
		OtPTailList = "TAIL LIST : " + string(ds_list_find_value(ds_queue_tail(global.InstOtPlayer.CommandQueue)[1], 0)) + " , " + 
		string(ds_list_find_value(ds_queue_tail(global.InstOtPlayer.CommandQueue)[1], 1)) + " , " + string(ds_list_find_value(ds_queue_tail(global.InstOtPlayer.CommandQueue)[1], 2));
		}
	draw_text((room_width /4)*2.5, room_height/10, OtPHead);
	draw_text((room_width /4)*2.5, (room_height/10)*2, OtPHeadList);
	draw_text((room_width /4)*2.5, (room_height/10)*3, OtPAAT);
	draw_text((room_width /4)*2.5, (room_height/10)*4, OtPTail);
	draw_text((room_width /4)*2.5, (room_height/10)*5, OtPTailList);
	draw_text((room_width /4)*2.5, (room_height/10)*6, "OtPVerticalSpeed : " + string(global.InstOtPlayer.VerticalSpeed));
	
	
	draw_set_color(c_white);
	draw_text((room_width/4)*1.5, (room_height/6)*4, "CT : " + string(get_timer()));
	draw_text((room_width/4)*1.5, (room_height/6)*4.5, "CTDif : " + string(ConnectedTimeDifference));
	draw_text((room_width/4)*1.5, (room_height/6)*5, "CTTot : " + string(ConnectedTimeDifference + get_timer()));
	
	draw_text((room_width/4)*1.5, (room_height/6)*1, "QueueSize OtP : " + string(ds_queue_size(global.InstOtPlayer.CommandQueue)));
	draw_text((room_width/4)*1.5, (room_height/6)*1.5, "QueueSize LOC : " + string(ds_queue_size(global.InstLocalPlayer.CommandQueue)));
	draw_text((room_width/4)*1.5, (room_height/6)*2, "CurComInx OTP : " + string(global.InstOtPlayer.CurrentCommandIndex));
	draw_text((room_width/4)*1.5, (room_height/6)*2.5, "CurComInx LOC : " + string(global.InstLocalPlayer.CurrentCommandIndex));
	}