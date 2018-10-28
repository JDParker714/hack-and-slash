/// @description Insert description here
// You can write your code in this editor
var on_ground = place_meeting(x,y+2,obj_wall);
//Add forces here
//gravity 
if gravity_isOn
{
	curr_speed[1] += gravity_;
	curr_speed[1] = clamp(curr_speed[1],-16,16);
}
if place_meeting(x,y,obj_wind){
	curr_windSpeed = -windSpeed;
}else{
	curr_windSpeed = 0;
}



switch(state)
{
	case "move":
		#region move state
		
		//Taking inputs
		if input.right
		{
			//transform curr_speed[0] here into running speed and add it together with all othere speeds in the end
			if curr_runSpeed < 0
			{
				curr_runSpeed = approach(curr_runSpeed,maxRun_speed,0.5);
			}
			curr_runSpeed = approach(curr_runSpeed,maxRun_speed,1);
		}
		
		if input.left
		{
			if curr_runSpeed > 0
			{
				curr_runSpeed = approach(curr_runSpeed,-maxRun_speed,0.5);
			}
			curr_runSpeed = approach(curr_runSpeed,-maxRun_speed,1);
		}
		
		if not input.right and not input.left
		{
			curr_runSpeed = approach(curr_runSpeed,0,2);
		}
		
		if keyboard_check_pressed(vk_up) and on_ground
		{
			on_ground = false;
			curr_jumpSpeed = -jump_force;	
		}else{
			curr_jumpSpeed = 0
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
				//here airAttack1 state
				state = "attack1";
				image_index = 0;
			}
			
		}
		//Checking if new state has been called
		if state != "move"{
			break
		}
		//Setting animations
		if (curr_speed[0] < 0){
			image_xscale = -1;
			sprite_index = s_skeleton_run_strip6;
		}else if(curr_speed[0] == 0){
			sprite_index = s_skeleton_idle_strip39;
			image_speed = 0.4;
		}else{
			image_xscale = 1;
			sprite_index = s_skeleton_run_strip6;
		}
		image_speed = abs(0.125*curr_speed[0]);
		
		//moving and checking for collisions
		curr_speed[0] = curr_runSpeed + curr_windSpeed
		curr_speed[1] += curr_jumpSpeed
		curr_speed = move_and_collide(curr_speed);
		show_debug_message(curr_speed)
		#endregion
		break;
		
	case "roll":
		#region roll state
		sprite_set_state(s_skeleton_roll_strip7,0.6,0)
		//move_and_collide(roll_speed*image_xscale,0)
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
		curr_xSpeed = knockback_speed;
	//	move_and_collide(curr_xSpeed,curr_ySpeed);
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

