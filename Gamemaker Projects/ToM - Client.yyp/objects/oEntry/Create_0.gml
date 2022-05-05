Start = false;
StartGuiDrawing = false;
global.SelectedCharacter = 1;

object_set_sprite(oEntryButton, sbtnStart);
StartBtn = instance_create_depth(room_width/2, (room_height/10)*7.5, 0, oEntryButton)
StartBtn.Instance = 1;
StartBtn.EntryInstance = id;

object_set_sprite(oEntryButton, sbtnExit);
ExitBtn = instance_create_depth(room_width/2, (room_height/10)*8.5, 0, oEntryButton)
ExitBtn.Instance = 2;

/*object_set_sprite(oCharacterSelectButton, sMikeSelect);
MikeBtn = instance_create_depth((room_width/10)*1, (room_height/10)*5, 0, oCharacterSelectButton)
MikeBtn.Instance = 1;

object_set_sprite(oCharacterSelectButton, sAnneSelect);
AnneBtn = instance_create_depth((room_width/10)*1, (room_height/10)*3, 0, oCharacterSelectButton)
AnneBtn.Instance = 2;