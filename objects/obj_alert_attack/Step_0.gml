event_inherited();
switch(state) {
	case "idle":
		#region idle
		if not instance_exists(obj_skeleton) break;
		if dist_to_player<alert_range
		{
			state = "chase";
		}
		
		#endregion
		break;
	
	case "chase":
		#region chase
		if dist_to_player>alert_range
		{
			move_and_collide(image_xscale*-chase_speed,0); //Undoing chase of chase_attack, may change this
			state = "idle";
		}
		#endregion
		break;
}

