function scHitscan(AnimationList, Direction){ //Attackdirection, 0 = left, 1 = right
	if (Direction == 0) { var TrueRange = -1 * AnimationList[|9]; var BBOX = bbox_left; }
	else { var TrueRange = AnimationList[|9]; var BBOX = bbox_right; }
	
	show_debug_message(string(BBOX + TrueRange));
	if (place_meeting(BBOX + TrueRange, y, all))
		{
		show_debug_message("HIT");
		if (Direction == 0)
			{
			var KnockbackAnim = ds_list_create();
			ds_list_copy(KnockbackAnim, scGetAnimProp(1000));
			KnockbackAnim[|6] = AnimationList[|6];
			KnockbackAnim[|7] = AnimationList[|7];
			}
		else if (Direction == 1)
			{
			var KnockbackAnim = ds_list_create();
			ds_list_copy(KnockbackAnim, scGetAnimProp(1001));
			KnockbackAnim[|6] = AnimationList[|6];
			KnockbackAnim[|7] = -1 * AnimationList[|7];
			}
		ds_list_copy(Id.CurrentAnimation, KnockbackAnim);
		Id.CurrentAnimation.CurrentAnimationFrame = 0;
		Id.Health -= AnimationList[|8];
		}
	
}