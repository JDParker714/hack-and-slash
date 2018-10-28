///@arg xspeed
///@arg yspeed

//GIT CHANGES

if not place_meeting(x+argument0,y,obj_wall)
{
	x+=argument0;
	if not place_meeting(x+argument0,y+1,obj_wall)
	{
		yminus = 1;
		while !place_meeting(x+argument0,y+yminus,obj_wall)and yminus<=abs(argument0) yminus+=1;
		if place_meeting(x+argument0,y+yminus,obj_wall)
		{
			y+= yminus-1;
		}
	}
}
else
{
	yplus = 0;
	while place_meeting(x+argument0,y-yplus,obj_wall)and yplus<=abs(argument0) yplus+=1;
	if !place_meeting(x+argument0,y-yplus,obj_wall)
	{
		y-= yplus;
		x+=argument0;
	} else {
		while !place_meeting(x+sign(argument0),y,obj_wall)
		{
			x+=sign(argument0);
		}
	}
}	
if not place_meeting(x,y+argument1,obj_wall)
{
	y+=argument1;
}
else
{
	while !place_meeting(x,y+sign(argument1),obj_wall)
	{
		y+=sign(argument1);
	}
}	