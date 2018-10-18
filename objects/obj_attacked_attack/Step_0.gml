if not instance_exists(player) exit;

switch(state) {
	case "idle":
		#region idle
		
		if hp < max_hp {
			state = "chase"; //If attacked, behave the same as a chase_attack enemy
		}
		
		#endregion
		break;
}

event_inherited();