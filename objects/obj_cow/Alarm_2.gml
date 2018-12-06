/// @description Insert description here
// You can write your code in this editor
movement = irandom_range(0, 4);
switch(movement) {
	case 0: state = "moveLeft"; break;
	case 1: state = "moveRight"; break;
	case 2: state = "idle"; break;
	case 4: state = "idle"; break;
	case 3: state = "idle"; break;
}

alarm[2]=random_range(random_lower,random_upper)*room_speed;