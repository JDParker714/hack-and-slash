/// @description Insert description here
// You can write your code in this editor
var number = sprite_get_number(s_skeleton_bones_strip10);
for (var i=0; i<number; i++)
{
	var bx = other.x+random_range(-8,8);
	var by = other.y+random_range(-24,8);
	var bone = instance_create_layer(bx,by,"Instances",obj_bones);
	bone.direction = 90 - (image_xscale * random_range(30,60));
	bone.speed = random_range(1,5);
			
	bone.image_index = i;
	if i==5 bone.image_angle = 130;
}
obj_hud.alarm[0] = 2*room_speed;
instance_destroy()