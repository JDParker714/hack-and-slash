event_inherited();
switch(state) {
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