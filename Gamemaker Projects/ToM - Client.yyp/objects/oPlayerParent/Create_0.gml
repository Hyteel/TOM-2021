//Initialization
HorizontalSpeed = 0
VerticalSpeed = 0;
ActiveCommand = 0;
ActiveArray[0] = 0;
ActiveArray[1] = 0;
CommandQueue = ds_queue_create();
LastCopy = true;


LagX = 0;
LagY = 0;

CollisionLayer = layer_get_id("tmCollision")
CollisionTileMap = layer_tilemap_get_id(CollisionLayer);