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
SlowDownVar = 0;
SlowDownConstant = 40000;
AttackHit = false;


//Stats
Health = 100;


//Commandbackend
ActiveCommand = 0;
ActiveArray = [0];
LastCopy = true;
var TempArr = [0, 0];
InputList = ds_list_create();
ds_list_add(InputList, TempArr);
InputListPos = 0;
NextAnim = [0, 0];


//Lag
LagX = 0;
LagY = 0;


//Detection
CollisionLayer = layer_get_id("tmCollision")
CollisionTileMap = layer_tilemap_get_id(CollisionLayer);