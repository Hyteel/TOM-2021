if (StartGuiDrawing)
	{
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fEntry);
	draw_rectangle((room_width/10)*3, (room_height/10)*8 - 24, (room_width/10)*7, (room_height/10)*8 + 24, true)
	draw_text(room_width/2, (room_height/10)*8, keyboard_string);
	}