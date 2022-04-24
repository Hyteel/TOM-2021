if (Start)
	{
	instance_destroy(StartBtn);
	instance_destroy(ExitBtn);
	StartGuiDrawing = true;
	Start = false;
	}
	
if (string_length(keyboard_string) > 15)
{
    keyboard_string = string_copy(keyboard_string, 1, 15);
}

if (StartGuiDrawing) && (keyboard_check_pressed(vk_enter))
	{
	global.Ip = keyboard_string;
	room_goto(rMain);
	}