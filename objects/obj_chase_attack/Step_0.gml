event_inherited();

switch(state) {
	case "chase":
		#region chase
		if not instance_exists(obj_skeleton) break;
		
		image_xscale = sign(obj_skeleton.x-x);
		if image_xscale = 0
		{
			image_xscale = 1;	
		}
		
		if dist_to_player>attack_range
		{
			move_and_collide(image_xscale*chase_speed,0);	
		} 
		else {
			state = "attack";
		}
		
		#endregion
		break;
}