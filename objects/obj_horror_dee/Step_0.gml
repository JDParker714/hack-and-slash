/// @description Insert description here
// You can write your code in this editor
var on_ground = place_meeting(x,y+1,obj_wall);
if not instance_exists(obj_skeleton) exit;
var dist_to_player = point_distance(x,y,obj_skeleton.x,obj_skeleton.y);

switch(state)
{
	case "move":
		#region chase
		sprite_set_state(hd_move,0.8,0)
		if not instance_exists(obj_skeleton) break;
		
		image_xscale = sign(obj_skeleton.x-x)*size;
		if image_xscale = 0
		{
			image_xscale = 1;	
		}
		
		if dist_to_player<alert_range
		{
			if dist_to_player>attack_range
			{
				move_and_collide(image_xscale*move_speed,0);
			} else {
				if can_attack
				{
					state = "attack";
				}
				else
				{
					state = "idle"
				}
			}
		} else {
			state = "idle";
		}
		
		#endregion
		break;
	case "attack":
		#region attack
		alarm[2] = 1*room_speed;
		sprite_set_state(hd_atk,1.4,0)
		
		if animation_hit_frame(8)
		{
			create_hitbox(x,y,self,hd_hb,8,4,5,image_xscale)
		}
		
		#endregion
		break;
	case "knockback":
		#region knockback
		sprite_set_state(hd_hit,0,0);
		image_xscale = -sign(knockback_speed);
		move_and_collide(knockback_speed,0);
		knockback_speed = approach(knockback_speed,0,0.6)
		if knockback_speed == 0
		{
			state = "move";
		}
		#endregion
		break;
	default:
		state = "move";
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

if on_ground and state=="move" and dist_to_player<alert_range and (place_meeting(x+image_xscale*move_speed,y,obj_wall))
{
	vspeed_ = -8
}