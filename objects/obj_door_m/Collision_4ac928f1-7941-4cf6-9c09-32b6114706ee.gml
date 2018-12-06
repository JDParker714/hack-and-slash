/// @description Insert description here
// You can write your code in this editor
if vspeed_>2
{
	vspeed_*=-0.4;	
	hspeed_/=2;
}
else
{
	vspeed_ = 0;
	while not place_meeting(x,y,obj_wall)
	{
		y++;	
	}
	gravity_ = 0;
	friction_ = 1;
	hspeed_ = 0;
	angular_speed = 0;
	alarm[0] = 2*room_speed;
	move = false;
}