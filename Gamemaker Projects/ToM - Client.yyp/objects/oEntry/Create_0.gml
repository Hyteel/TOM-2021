Start = false;
StartGuiDrawing = false;
IpInputText = "";

object_set_sprite(oEntryButton, sbtnStart);
StartBtn = instance_create_depth(room_width/2, (room_height/10)*7.5, 0, oEntryButton)
StartBtn.Instance = 1;
StartBtn.EntryInstance = id;

object_set_sprite(oEntryButton, sbtnExit);
ExitBtn = instance_create_depth(room_width/2, (room_height/10)*8.5, 0, oEntryButton)
ExitBtn.Instance = 2;