function scHitscan(Dir, HitBoxX, HitBoxY, HitBoxH, HitBoxW, KnockBackIntensity, Damage){ 
	var Inst = collision_rectangle(
	HitBoxX*Dir + (bbox_right - 32), 
	HitBoxY + (bbox_top + 32), 
	HitBoxX*Dir + HitBoxW*Dir + (bbox_right - 32), 
	HitBoxY + (bbox_top + 32) + HitBoxH,
	oOtPlayer, false, true);
	
	show_debug_message(string(HitBoxX*Dir + (bbox_right - 32)));
	show_debug_message(string(HitBoxY + (bbox_top + 32)));
	show_debug_message(string(HitBoxX*Dir + HitBoxW*Dir + (bbox_right - 32)));
	show_debug_message(string(HitBoxY + (bbox_top + 32) + HitBoxH));
	
	if (Dir < 0) { Dir = 0; }
	
	if (Inst != noone)
		{	
		show_message("HIT");
		AttackHit = true;
		buffer_seek(global.ClientBuffer, buffer_seek_start, 0);
		buffer_write(global.ClientBuffer, buffer_u8, Network.SendCurrentInput);
		buffer_write(global.ClientBuffer, buffer_u16, 1000 + KnockBackIntensity + Dir*10);
		buffer_write(global.ClientBuffer, buffer_u8, Damage);
		network_send_packet(global.ClientSocket, global.ClientBuffer, buffer_tell(global.ClientBuffer));
		}
	
}