if (DebugMode == 0)
	{
	draw_set_color(c_aqua);
	draw_text(room_width/2.5, 0, "LOCAL PLAYER");
	if !(is_undefined(ds_queue_head(global.InstLocalPlayer.CommandQueue)))
		{
		LocPHead = "HEAD : " + string(ds_queue_head(global.InstLocalPlayer.CommandQueue)[0]) + " , " + string(ds_queue_head(global.InstLocalPlayer.CommandQueue)[1]);
		LocPAAT = "ACTIVEARRAY TIME : " + string(global.InstLocalPlayer.ActiveArray[0]);
		}
	draw_text(room_width/16, room_height/10, LocPHead);
	draw_text(room_width/16, (room_height/10)*2, LocPAAT);
	draw_text(room_width/16, (room_height/10)*3, "Current Frame " + string(global.InstLocalPlayer.CurrentFrame));

	
	draw_set_color(c_orange);
	draw_text(room_width/2.5, room_height/10, "OT PLAYER");
	if !(is_undefined(ds_queue_head(global.InstOtPlayer.CommandQueue)))
		{
		OtPHead = "HEAD : " + string(ds_queue_head(global.InstOtPlayer.CommandQueue)[0]) + " , " + string(ds_queue_head(global.InstOtPlayer.CommandQueue)[1]);
		OtPAAT = "ACTIVEARRAY TIME : " + string(global.InstOtPlayer.ActiveArray[0]);
		}
	draw_text((room_width/4)*2.5, room_height/10, OtPHead);
	draw_text((room_width/4)*2.5, (room_height/10)*2, OtPAAT);
	draw_text((room_width/4)*2.5, (room_height/10)*3, "Current Frame " + string(global.InstOtPlayer.CurrentFrame));
	
	
	draw_set_color(c_white);
	draw_text((room_width/4)*1.5, (room_height/6)*4, "CT : " + string(get_timer()));
	draw_text((room_width/4)*1.5, (room_height/6)*4.5, "CTDif : " + string(ConnectedTimeDifference));
	draw_text((room_width/4)*1.5, (room_height/6)*3.5, "CTTot : " + string(ConnectedTimeDifference + get_timer()));
	draw_text((room_width/4)*0.5, (room_height/6)*3.5, "LastAnimLOC : " + string(global.InstLocalPlayer.LastAnim));
	draw_text((room_width/4)*2.5, (room_height/6)*3.5, "LastAnimOTP : " + string(global.InstOtPlayer.LastAnim));
	draw_text((room_width/4)*2, (room_height/6)*5.5, "MX : " + string(mouse_x));
	draw_text((room_width/4)*1, (room_height/6)*5.5, "MY : " + string(mouse_y));
	
	draw_text((room_width/4)*1.5, (room_height/6)*1, "QueueSize OtP : " + string(ds_queue_size(global.InstOtPlayer.CommandQueue)));
	draw_text((room_width/4)*1.5, (room_height/6)*1.5, "QueueSize LOC : " + string(ds_queue_size(global.InstLocalPlayer.CommandQueue)));
	}