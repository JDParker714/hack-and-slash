event_inherited();

if(hp < last_hp) {
	state = "spooked";
	image_xscale = choose(-1, 1);
	alarm[0] = move_time*room_speed;
}

switch(state) {	
	case "spooked":
		#region spooked
		move_and_collide(move_speed * image_xscale, 0);	
		break;
		#endregion
}

last_hp = hp;