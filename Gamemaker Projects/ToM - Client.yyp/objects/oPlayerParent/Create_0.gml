//Movement
Id = 0;
BaseGravity = 5;
Gravity = BaseGravity;
MaxGravity = 10;
GravityAcceleration = 0.1;
NoGrav = false;
LastAnim = 0;

 
//Animation
CurrentAnimation = [0, 0, 0, 0, 0, 0];
CurrentFrame = 0;
NextFrameTime = 0;
CurrentAnimTimeDiv = 0;
AttackHit = false;


//Stats
Health = 100;


//Commandbackend
ActiveCommand = 0;
ActiveArray = [0];
CommandQueue = ds_queue_create();
LastCopy = true;


//Lag
LagX = 0;
LagY = 0;


//Detection
CollisionLayer = layer_get_id("tmCollision")
CollisionTileMap = layer_tilemap_get_id(CollisionLayer);