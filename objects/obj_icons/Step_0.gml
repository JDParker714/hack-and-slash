if !pressed {
	if input.right && selection % 3 != 0{
		if selection == 4 selection = 6;
		else selection++;
		pressed = true;
	}
	
	if input.left && selection % 3 != 1{
		if selection == 6 selection = 4;
		else selection--;
		pressed = true;
	}
	
	if input.up && selection - 3 > 0{
		if selection == 8 selection = 2;
		else selection-=3;
		pressed = true;
	}
	
	if input.down && selection + 3 < 10{
		if selection == 2 selection = 8;
		else selection+=3;
		pressed = true;
	}

	if input.space {
		room_goto(level1);
	}

	if pressed alarm[0] = key_delay*room_speed;
}


image_index = selection;