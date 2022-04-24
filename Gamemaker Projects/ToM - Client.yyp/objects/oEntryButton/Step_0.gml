if ((bbox_left < mouse_x) && (mouse_x < bbox_right)) && ((bbox_top < mouse_y) && (mouse_y < bbox_bottom))
	{
	image_index = 1;
	if (mouse_check_button_pressed(mb_left))
		{
		scBtnAction(Instance);
		}
	}
else
	{
	image_index = 0;
	}