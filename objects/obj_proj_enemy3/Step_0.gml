hp = max_hp;

switch(state)
{
	case "idle": 
		sprite_set_state(s_knight_idle_strip3, 0.6, 0);
		if shot % fire_rate == 0 
			state = "attack";
	
		break;
	case "attack":
		#region attack
		sprite_set_state(s_knight_attack_strip12,0.6,0);
		if animation_hit_frame(4)
		{
			proj = instance_create_layer(x, y-20, "Instances", obj_para_proj);
			proj.image_xscale = image_xscale;
		}
		
		#endregion
		break;
}
shot += 1;