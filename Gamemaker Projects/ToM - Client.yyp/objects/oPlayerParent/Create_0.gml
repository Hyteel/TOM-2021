//Initialization
ovarLastInput = 0;
MaxHorizontalSpeed = 2;
Acceleration = 0.1;
BaseHorizontalSpeed = 2;
HorizontalSpeed = BaseHorizontalSpeed;
LastDirection = 0;
Decceleration = 0.5;
VerticalSpeed = 0;
Gravity = 0.1;
CurrentlyJumping = false;


ActiveCommands = ds_list_create();


LagX = 0;
LagY = 0;
LagXSpeed = 0.1;
LagYSpeed = 0.1;


CollisionLayer = layer_get_id("tmCollision")
CollisionTileMap = layer_tilemap_get_id(CollisionLayer);