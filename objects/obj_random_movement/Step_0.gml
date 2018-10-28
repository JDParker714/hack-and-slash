switch(state) {
	case "moveLeft":
		image_xscale = -1;
		move_and_collide(move_speed * image_xscale, 0);
		state = "idle";
		break;
	case "moveRight":
		image_xscale = 1;
		move_and_collide(move_speed * image_xscale, 0);
		state = "idle";
		break;
}