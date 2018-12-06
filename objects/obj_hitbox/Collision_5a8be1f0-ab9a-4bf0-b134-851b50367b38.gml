/// @description Insert description here
// You can write your code in this editor
if not instance_exists(other) exit;
if not instance_exists(creator) exit;
if creator==noone or creator == other or creator.object_index== other.object_index or (ds_list_find_index(hit_objects,other)!=-1)
{
	exit;
}
//dont hit player while dodging
if other.object_index==obj_skeleton and other.state == "roll"
{
	show_debug_message("rolling")
	exit;
}
if object_is_ancestor(creator.object_index,obj_enemy_parent) and object_is_ancestor(other.object_index,obj_enemy_parent) exit;
other.hp-=damage;
repeat (10)
{
	instance_create_layer(other.x,other.y-abs(other.bbox_bottom-other.bbox_top)/2,"Effects",obj_hit_effect);
}

if not instance_exists(other) exit;
if instance_exists(obj_enemy1) and other.object_index == obj_enemy1.object_index
{
	other.show_hp = 1;
	other.alarm[1] = 2*room_speed;
}
if instance_exists(obj_enemy3) and other.object_index == obj_enemy3.object_index
{
	other.show_hp = 1;
	other.alarm[1] = 2*room_speed;
}
if instance_exists(obj_horror_dee) and other.object_index == obj_horror_dee.object_index
{
	other.show_hp = 1;
	other.alarm[1] = 2*room_speed;
}
if instance_exists(obj_proj_enemy) and other.object_index == obj_proj_enemy.object_index
{
	other.show_hp = 1;
	other.alarm[1] = 2*room_speed;
}
if instance_exists(obj_cow) and other.object_index == obj_cow.object_index
{
	other.show_hp = 1;
	other.alarm[1] = 2*room_speed;
}

if instance_exists(obj_skeleton) 
{
	if creator.object_index == obj_skeleton and other.hp<=0
	{
		obj_skeleton.kills+=1;
	}
	if other.object_index == obj_skeleton
	{
		if creator.object_index==obj_enemy1
		{
			add_screenshake(12,10)
		}
		if obj_skeleton.hp<=0
		{
			var number = sprite_get_number(s_skeleton_bones_strip10);
			obj_camera.player_death = true;
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
		}
	} else {
		add_screenshake(10,5)
	}
}

ds_list_add(hit_objects,other);
other.state = "knockback";
other.knockback_speed = knockback*image_xscale;
other.image_xscale = -image_xscale;
//show_debug_message(other.hp)