/// @description Insert description here
// You can write your code in this editor
var on_ground = place_meeting(x,y+1,obj_wall);
if not instance_exists(obj_skeleton) exit;
var dist_to_player = point_distance(x,y,obj_skeleton.x,obj_skeleton.y);

switch(state)
{
	case "idle":
		sprite_set_state(s_knight_walk_strip4,0.2,0)
		if dist_to_player<alert_range
		{
			state = "chase";
		}
		break;
	case "chase":
		#region chase
		sprite_set_state(s_knight_walk_strip4,0.2,0)
		if not instance_exists(obj_skeleton) break;
		
		image_xscale = sign(obj_skeleton.x-x)*size;
		if image_xscale = 0
		{
			image_xscale = size;	
		}
		
		if dist_to_player<alert_range
		{
			if dist_to_player>attack_range
			{
				move_and_collide(sign(image_xscale)*chase_speed,0);	
			} else {
				state = "attack";
			}
		} else {
			state = "idle";
		}
		
		#endregion
		break;
	case "attack":
		#region attack
		sprite_set_state(s_knight_attack_strip12,0.6,0)
		
		if animation_hit_frame(4)
		{
			create_hitbox(x,y,self,s_skeleton_attack_one_damage,6,4,10,sign(image_xscale))
		}
		
		#endregion
		break;
	case "knockback":
		#region knockback
		sprite_set_state(s_knight_hitstun,0,0);
		image_xscale = -sign(knockback_speed)*size;
		move_and_collide(knockback_speed,0);	
		knockback_speed = approach(knockback_speed,0,0.6)
		if knockback_speed == 0
		{
			state = "chase";
		}
		#endregion
		break;
	default:
		state = "idle";
		break;
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

if on_ground and state=="chase" and dist_to_player<alert_range and (place_meeting(x+image_xscale*chase_speed,y,obj_wall))
{
	vspeed_ = -8
}