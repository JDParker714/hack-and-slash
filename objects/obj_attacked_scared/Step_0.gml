event_inherited();

switch(state) {
	case "idle":
		#region idle
		if hp < max_hp {
			state = "scared";
		}
		break;
		#endregion
	
	case "scared":
		#region scared
		if dist_to_player < scared_range {
			image_xscale = -player_hdirection;
			move_and_collide(move_speed * image_xscale, 0);	
		}
		break;
		#endregion
}
