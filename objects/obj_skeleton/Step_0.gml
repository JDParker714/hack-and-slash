/// @description Insert description here
// You can write your code in this editor
var on_ground = place_meeting(x,y+2,obj_wall);

switch(state)
{
	case "move":
		#region move state
		if input.right
		{
			move_and_collide(run_speed,0)
			image_xscale = 1;
			sprite_index = s_skeleton_run_strip6;
			image_speed = 0.6;
		}
		if input.left
		{
			move_and_collide(-run_speed,0)
			image_xscale = -1;
			sprite_index = s_skeleton_run_strip6;
			image_speed = 0.6;
		}
		if not input.right and not input.left
		{
			sprite_index = s_skeleton_idle_strip39;
			image_speed = 0.4;
		}
		if input.roll
		{
			state = "roll";
			image_index = 0;
		}
		if input.attack
		{
			if on_ground
			{
				state = "attack1";
				image_index = 0;
			} else{
				state = "attack1";
				image_index = 0;
				vspeed_ = -8
			}
		}
		#endregion
		break;
		
	case "roll":
		#region roll state
		sprite_set_state(s_skeleton_roll_strip7,0.6,0)
		move_and_collide(roll_speed*image_xscale,0)
		if animation_end()
		{
			state = "move";	
		}
		#endregion
		break;
	case "attack1":
		#region attack1 state
		sprite_set_state(s_skeleton_attack_one_strip5,0.5,0)
		
		if animation_hit_frame(1) 
		{
			create_hitbox(x,y,self,s_skeleton_attack_one_damage,4,4,5,image_xscale)
		}
		
		if input.attack and animation_hit_frame_range(2,4)
		{
			if on_ground
			{
				state = "attack2";
			}
			else
			{
				state = "attack2";
				hspeed_ = 12*sign(image_xscale);
			}
		}
		#endregion
		break;
	case "attack2":
		#region attack2 state
		sprite_set_state(s_skeleton_attack_two_strip5,0.5,0)
		
		if animation_hit_frame(1)
		{
			create_hitbox(x,y,self,s_skeleton_attack_two_damage,4,4,5,image_xscale)
		}
		
		if input.attack and animation_hit_frame_range(2,4) and on_ground
		{
			state = "attack3";
		}
		#endregion
		break;
	case "attack3":
		#region attack2 state
		sprite_set_state(s_skeleton_attack_three_strip6,0.5,0)
		
		if animation_hit_frame(2)
		{
			create_hitbox(x,y,self,s_skeleton_attack_three_damage,6,4,5,image_xscale)
		}
		
		#endregion
		break;
	case "knockback":
		#region knockback
		sprite_set_state(s_skeleton_hitstun,0,0);
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
	vspeed_ = clamp(vspeed_,-16,16);
	if vspeed_ < 0 and place_meeting(x,y+vspeed_,obj_wall)
	{
		vspeed_ = 2;
	}
} else {
	if keyboard_check_pressed(vk_up) and state == "move"
	{
		vspeed_ = -8;	
	}
}
if was_grounded == false and on_ground==true
{
	vspeed_ = 0;	
}
hspeed_ -=sign(hspeed_);
move_and_collide(hspeed_,vspeed_)

was_grounded = on_ground;