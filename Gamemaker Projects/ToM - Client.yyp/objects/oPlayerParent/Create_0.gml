//Initialization
ovarLastInput = 0;
MaxHorizontalSpeed = 10;
Acceleration = 0.1;
BaseHorizontalSpeed = 6;
HorizontalSpeed = BaseHorizontalSpeed;
LastDirection = 0;
VerticalSpeed = 0;
Gravity = 0.1;
CurrentlyJumping = false;
InitialJumpHeight = 30;
AdditionalJumpHeight = 10;
MaxJumpFrames = 20;
CurrentJumpFrame = 0;

ActiveCommands = ds_list_create();
QueuedCommands = ds_grid_create(2, 11);
CurrentCommandIndex = 0;
CurrentCommandPosition = 10;

CurrentHeldArrayTime = 0;

LagX = 0;
LagY = 0;
LagXSpeed = 0.1;
LagYSpeed = 0.1;


CollisionLayer = layer_get_id("tmCollision")
CollisionTileMap = layer_tilemap_get_id(CollisionLayer);