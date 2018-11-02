event_inherited();

/*if(hp < last_hp) {
	state = "spooked";
	image_xscale = choose(-1, 1);
	alarm[0] = move_time*room_speed;
}*/

switch(state) {	
	case "knockback":
		#region knockback
		image_xscale = -sign(knockback_speed);
		move_and_collide(knockback_speed,0);	

		knockback_speed = approach(knockback_speed,0,0.6)
		if knockback_speed == 0
		{
			state = "spooked";
			image_xscale = choose(-1, 1);
			alarm[0] = move_time*room_speed;
		}
		#endregion
		break;
		
	case "spooked":
		#region spooked
		move_and_collide(move_speed * image_xscale, 0);	
		break;
		#endregion
}

//last_hp = hp;