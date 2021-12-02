//Initialization
ovarLastInput = 0;
MaxHorizontalSpeed = 10;
Acceleration = 0.1;
BaseHorizontalSpeed = 6;
HorizontalSpeed = BaseHorizontalSpeed;
LastDirection = 0;
VerticalSpeed = 0;
Gravity = 0.2;
MaxGravity = 10;
CurrentlyJumping = false;
InitialJumpHeight = 30;
AdditionalJumpHeight = 10;
MaxJumpFrames = 20;
CurrentJumpFrame = 0;

ActiveCommands = ds_list_create();
ActiveArray[0] = 0;
ActiveArray[1] = 0;
CommandQueue = ds_queue_create();
LastCopy = true;

CurrentCommandIndex = 0;
CurrentCommandPosition = 9;
CurrentHeldArrayTime = 0;

Animated = false;
CurrentAnimation = 0;
CurrentFrame = 0;

LagX = 0;
LagY = 0;
LagXSpeed = 0.1;
LagYSpeed = 0.1;


CollisionLayer = layer_get_id("tmCollision")
CollisionTileMap = layer_tilemap_get_id(CollisionLayer);