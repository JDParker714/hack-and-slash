event_inherited();
if (state == "chase") 
{
	state = "idle";
}

if not instance_exists(player) exit;

var on_ground = place_meeting(x,y+1,obj_wall);

switch(state)
{
	case "idle":
		#region idle
		sprite_set_state(s_knight_walk_strip4,0.2,0)
		if not instance_exists(obj_skeleton) break;
		
		image_xscale = sign(obj_skeleton.x-x);
		if image_xscale = 0
		{
			image_xscale = 1;	
		}
		if dist_to_player <= alert_range {
			state = "attack";
		}
		#endregion
		break;
	case "attack":
		#region attack
		if shot % fire_rate == 0 {
			sprite_set_state(s_knight_attack_strip12,0.6,0);
			if animation_hit_frame(4)
			{
				instance_create_layer(x, y-20, "Instances", obj_proj);
			}
		}
		
		#endregion
		break;
	case "knockback":
		#region knockback
		sprite_set_state(s_knight_hitstun,0,0);
		image_xscale = -sign(knockback_speed);
		if not place_meeting(x+knockback_speed,y,obj_enemy1)
		{
			move_and_collide(knockback_speed,0);
		}
		knockback_speed = approach(knockback_speed,0,0.6)
		if knockback_speed == 0
		{
			state = "idle";
		}
		#endregion
		break;
	default:
		state = "idle";
		break;
	shot = shot + 1;
}

if !on_ground
{
	vspeed_ +=gravity_;
}
if was_grounded == false and on_ground==true
{
	vspeed_ = 0;	
}
move_and_collide(0,vspeed_)

was_grounded = on_ground;