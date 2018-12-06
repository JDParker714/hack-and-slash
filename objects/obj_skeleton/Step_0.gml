/// @description Insert description here
// You can write your code in this editor
var on_ground = place_meeting(x,y+2,obj_wall);


switch(state)
{
	case "move":
		#region move state
		mask_index = main_hitbox;
		if input.right
		{
			move_and_collide(run_speed,0)
			image_xscale = size;
			sprite_index = main_run;
			image_speed = 0.6;
			if !on_ground
			{
				image_speed = 0;
				if vspeed_ > 0
				{
					sprite_index = main_down;
				} else {
					sprite_index = main_up;
				}
			}
		}
		if input.left
		{
			move_and_collide(-run_speed,0)
			image_xscale = -size;
			sprite_index = main_run;
			image_speed = 0.6;
			if !on_ground
			{
				image_speed = 0;
				if vspeed_ > 0
				{
					sprite_index = main_down;
				} else {
					sprite_index = main_up;
				}
			}
		}
		if not input.right and not input.left and not input.attack
		{
			sprite_index = main_idle;
			image_speed = 0.4;
			if !on_ground
			{
				image_speed = 0;
				if vspeed_ > 0
				{
					sprite_index = main_down;
				} else {
					sprite_index = main_up;
				}
			}
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
				vspeed_ = 0;
			} else{
				state = "attack1";
				image_index = 0;
				vspeed_ = -8;
			}
		}
		#endregion
		break;
		
	case "roll":
		#region roll state
		sprite_set_state(main_roll,0.6,0)
		move_and_collide(roll_speed*image_xscale,0)
		if animation_end()
		{
			state = "move";	
		}
		#endregion
		break;
	case "attack1":
		#region attack1 state
		sprite_set_state(main_atk1,0.7,0)
		mask_index = main_hitbox_atk1;
		if animation_hit_frame(1) 
		{
			create_hitbox(x,y,self,main_atk1_hb,4,4,5,image_xscale)
		}
		
		if input.attack and animation_hit_frame_range(2,5)
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
		mask_index = main_hitbox_atk2;
		sprite_set_state(main_atk2,0.7,0)
		
		if animation_hit_frame(1)
		{
			create_hitbox(x,y,self,main_atk2_hb,4,4,5,image_xscale)
		}
		
		if input.attack and animation_hit_frame_range(2,5) and on_ground
		{
			state = "attack3";
		}
		#endregion
		break;
	case "attack3":
		#region attack2 state
		mask_index = main_hitbox_atk3;
		sprite_set_state(main_atk3,0.7,0)
		
		if animation_hit_frame(4)
		{
			create_hitbox(x,y,self,main_atk3_hb,6,4,5,image_xscale)
		}
		
		#endregion
		break;
	case "knockback":
		#region knockback
		sprite_set_state(main_hs,0,0);
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
		vspeed_ = -9;	
	}
}
if was_grounded == false and on_ground==true
{
	vspeed_ = 0;	
}
hspeed_ -=sign(hspeed_);
move_and_collide(hspeed_,vspeed_)

was_grounded = on_ground;

draw_shader = keyboard_check(vk_enter)