function scHitscan(Dir, HitBoxX, HitBoxY, HitBoxH, HitBoxW, KnockBackIntensity, Damage){ 
	var Inst = collision_rectangle(
	HitBoxX*Dir, 
	HitBoxY + (bbox_top - 32 + HitBoxH/2), 
	HitBoxX*Dir + HitBoxW*Dir, 
	HitBoxY - (bbox_top - 32 + HitBoxH/2),
	oOtPlayer, false, true);
	
	if (Inst != noone)
		{
		buffer_seek(global.ClientBuffer, buffer_seek_start, 0);
		buffer_write(global.ClientBuffer, buffer_u8, Network.SendAttack);
		buffer_write(global.ClientBuffer, buffer_u8, KnockBackIntensity);	
		buffer_write(global.ClientBuffer, buffer_u8, Damage);
		network_send_packet(global.ClientSocket, global.ClientBuffer, buffer_tell(global.ClientBuffer));
		}
	
}