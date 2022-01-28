// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scCollisionCheck(Axis, Movement){
	
	if ((Axis == "Y") && (Movement > 0))
		{
		if ((tilemap_get_at_pixel(CollisionTileMap, bbox_left + 1, bbox_bottom + 1) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_right - 1, bbox_bottom + 1) != 0)) { return(true); }
		else
			{
			
			if ((tilemap_get_at_pixel(CollisionTileMap, bbox_left, bbox_bottom + Movement) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_right, bbox_bottom + Movement) != 0))
				{
				y = floor((bbox_bottom + Movement)/16) * 16 + bbox_top - bbox_bottom;
				return(true);
				}
			}
		}
	
	if ((Axis == "Y") && (Movement < 0))
		{
		if ((tilemap_get_at_pixel(CollisionTileMap, bbox_left, bbox_top - 1) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_right, bbox_top - 1) != 0)) { return(true); }
		else
			{
			if ((tilemap_get_at_pixel(CollisionTileMap, bbox_left, bbox_top + Movement) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_right, bbox_top + Movement) != 0))
				{
				y = floor((bbox_bottom + Movement)/16) * 16 - (bbox_top - bbox_bottom);
				return(true);
				}
			}
		}
	
	if ((Axis == "X") && (Movement < 0))
		{
		if ((tilemap_get_at_pixel(CollisionTileMap, bbox_left - 1, bbox_bottom - 1) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_left - 1, bbox_top + 1) != 0)) { return(true); }
		else
			{
			if ((tilemap_get_at_pixel(CollisionTileMap, bbox_left - Movement, bbox_bottom - 1) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_left - Movement, bbox_top + 1) != 0))
				{
				x = floor((bbox_left - Movement)/16) * 16 + 16;
				return(true);
				}
			}
		}
	
	if ((Axis == "X") && (Movement > 0))
		{
		if ((tilemap_get_at_pixel(CollisionTileMap, bbox_right + 1, bbox_bottom - 1) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_right + 1, bbox_top + 1) != 0)) { return(true); }
		else
			{
			if ((tilemap_get_at_pixel(CollisionTileMap, bbox_right + Movement, bbox_bottom - 1) != 0) || (tilemap_get_at_pixel(CollisionTileMap, bbox_right + Movement, bbox_top + 1) != 0))
				{
				x = floor((bbox_right + Movement)/16) * 16 - (bbox_right - bbox_left) - 1;
				return(true);
				}
			}
		}
	
	return (false);
}