/// @description Insert description here
// You can write your code in this editor
event_inherited();
if not instance_exists(player) exit;

switch(state)
{
	case "chase":
		if not instance_exists(obj_skeleton) break;
		if place_meeting(x,y,obj_skeleton) and attacked==false and obj_skeleton.state == "move"
		{
			create_hitbox(x,y,self,sprite_index,4,1,damage,image_xscale)
			attacked = true;
		}
		if attacked == true
		{
			vspeed = -4;
		}
		break;
}
move_and_collide(hspeed_,2)
if abs(prev_x-x) < 1
{
	vspeed = -4;
}
prev_x = x;