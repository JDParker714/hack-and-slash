/// @description Insert description here
// You can write your code in this editor

if !alive
{
    image_alpha-=0.05;//change this to affect the fading speed
    if image_alpha<0 instance_destroy();
}
if move==true
{
	image_angle += angular_speed;
	move_and_collide(hspeed_,vspeed_)
	vspeed_ += gravity_;
	hspeed_ -= friction_*sign(hspeed_)	
	if place_meeting(x,y+1,obj_wall) and vspeed_>0
	{
		if vspeed_>2
		{
			vspeed_*=-0.4;	
			hspeed_/=2;
		}
		else
		{
			while not place_meeting(x,y,obj_wall)
			{
				y++;	
			}
			friction_ = 1;
			hspeed_ = 0;
			alarm[0] = 2*room_speed ;
			move = false;
		}
	}
} else {
	move_and_collide(0,5);
}
