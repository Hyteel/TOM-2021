if ((bbox_left < mouse_x) && (mouse_x < bbox_right)) && ((bbox_top < mouse_y) && (mouse_y < bbox_bottom))
	{
	if (mouse_check_button_pressed(mb_left))
		{
		global.SelectedCharacter = Instance;
		}
	}
	
if (global.SelectedCharacter == Instance)
	{
	image_index = 1;
	}
else
	{
	image_index = 0;
	}