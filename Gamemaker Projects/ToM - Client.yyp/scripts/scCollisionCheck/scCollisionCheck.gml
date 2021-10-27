// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scCollisionCheck(Direction){
	
	if (Direction == "Down")
		{
		//show_debug_message("IntoCollision");
		if ((tilemap_get_at_pixel(CollisionTileMap, bbox_left + 1, bbox_bottom + 1) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_right - 1, bbox_bottom + 1) != 0)) { return(true); }
		else
			{
			
			if ((tilemap_get_at_pixel(CollisionTileMap, bbox_left, bbox_bottom + VerticalSpeed) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_right, bbox_bottom + VerticalSpeed) != 0))
				{
				y = floor((bbox_bottom + VerticalSpeed)/16) * 16 + bbox_top - bbox_bottom;
				return(true);
				}
			}
		}
	
	if (Direction == "Up")
		{
		if ((tilemap_get_at_pixel(CollisionTileMap, bbox_left, bbox_top - 1) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_right, bbox_top - 1) != 0)) { return(true); }
		else
			{
			if ((tilemap_get_at_pixel(CollisionTileMap, bbox_left, bbox_top + VerticalSpeed) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_right, bbox_top + VerticalSpeed) != 0))
				{
				y = floor((bbox_bottom + VerticalSpeed)/16) * 16 - (bbox_top - bbox_bottom);
				return(true);
				}
			}
		}
	
	if (Direction == "Left")
		{
		if ((tilemap_get_at_pixel(CollisionTileMap, bbox_left - 1, bbox_bottom - 1) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_left - 1, bbox_top + 1) != 0)) { return(true); }
		else
			{
			if ((tilemap_get_at_pixel(CollisionTileMap, bbox_left + HorizontalSpeed, bbox_bottom - 1) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_left + HorizontalSpeed, bbox_top + 1) != 0))
				{
				x = floor((bbox_left + HorizontalSpeed)/16) * 16 + bbox_right - bbox_left;
				return(true);
				}
			}
		}
	
	if (Direction == "Right")
		{
		if ((tilemap_get_at_pixel(CollisionTileMap, bbox_right + 1, bbox_bottom - 1) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_right + 1, bbox_top + 1) != 0)) { return(true); }
		else
			{
			if ((tilemap_get_at_pixel(CollisionTileMap, bbox_right + HorizontalSpeed, bbox_bottom - 1) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_right + HorizontalSpeed, bbox_top + 1) != 0))
				{
				x = floor((bbox_right + HorizontalSpeed)/16) * 16 - (bbox_right - bbox_left);
				return(true);
				}
			}
		}
	
	return (false);
}