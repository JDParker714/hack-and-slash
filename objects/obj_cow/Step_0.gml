switch(state) {
	case "moveLeft":
		image_xscale = -1;
		move_and_collide(move_speed * image_xscale, 0);
		break;
	case "moveRight":
		image_xscale = 1;
		move_and_collide(move_speed * image_xscale, 0);
		break;
	case "idle":
		pick_animation = choose(1, 2);
		if(pick_animation == 1) {
			sprite_set_state(s_cow_idle1, 1, 0);
			state = "idling";
		} else {
			sprite_set_state(s_cow_idle2, 1, 0);
			state = "idling";
		}
		break;
}