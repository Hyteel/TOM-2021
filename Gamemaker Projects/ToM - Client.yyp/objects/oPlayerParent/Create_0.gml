//Movement
HorizontalSpeed = 0
VerticalSpeed = 0;


//Animation
CurrentAnimation = ds_list_create();
ds_list_add(CurrentAnimation, 0);
CurrentFrame = 0;
CurrentAnimationFrame = 0;
SlowDownVar = 0;


//Commandbackend
ActiveCommand = 0;
ActiveArray[0] = 0;
ActiveArray[1] = 0;
CommandQueue = ds_queue_create();
LastCopy = true;


//Lag
LagX = 0;
LagY = 0;


//Detection
CollisionLayer = layer_get_id("tmCollision")
CollisionTileMap = layer_tilemap_get_id(CollisionLayer);