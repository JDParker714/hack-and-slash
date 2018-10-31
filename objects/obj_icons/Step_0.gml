if !pressed {
	get_input();

	if right && selection % 3 != 0{
		if selection == 4 selection = 6;
		else selection++;
		pressed = true;
		
	}
	if left && selection % 3 != 1{
		if selection == 6 selection = 4;
		else selection--;
		pressed = true;
	}
	if up && selection - 3 > 0{
		if selection == 8 selection = 2;
		else selection-=3;
		pressed = true;
	}
	if down && selection + 3 < 10{
		if selection == 2 selection = 8;
		else selection+=3;
		pressed = true;
	}
	if pressed alarm[0] = key_delay*room_speed;
}


image_index = selection;