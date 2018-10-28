event_inherited();
if not instance_exists(player) exit;

switch(state) {
	case "chase":
		#region chase
		
		image_xscale = sign(player_hdirection);
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