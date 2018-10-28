movement = irandom_range(0, 2);
switch(movement) {
	case 0: state = "moveLeft"; break;
	case 1: state = "moveRight"; break;
	case 2: state = "idle"; break;
}

alarm[2]=random_range(random_lower,random_upper)*room_speed;