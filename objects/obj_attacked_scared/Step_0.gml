event_inherited();

switch(state) {
	case "idle":
		#region idle
		if hp < max_hp {
			state = "spooked";
		}
		break;
		#endregion
	
	case "spooked":
		#region spooked
		if dist_to_player < scared_range {
			x += move_speed * -player_hdirection;	
		}
		break;
		#endregion
}
