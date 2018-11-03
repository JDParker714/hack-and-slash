/// @description Checking Hitboxes

if not instance_exists(other) exit;
if not instance_exists(creator) exit;
if creator==noone or creator == other or creator.object_index== other.object_index or (ds_list_find_index(hit_objects,other)!=-1)
{
	exit;
}
//Dont hit player while dodging
if other==player and other.state == "roll"
{
	exit;	
}

//Enemies can't hit other enemies
if object_is_ancestor(creator.object_index,obj_enemy_parent) and object_is_ancestor(other.object_index,obj_enemy_parent) exit;
if other.hp <= 0 exit;

//Else, take off their HP
other.hp-=damage;
repeat (10)
{
	instance_create_layer(other.x,other.y-other.sprite_height/2,"Effects",obj_hit_effect);
}

if not instance_exists(other) exit;

//Generalized to show HP for enemies
if object_is_ancestor(other.object_index, obj_enemy_parent)
{
	other.show_hp = 1;
	other.alarm[1] = 2*room_speed;
}


if instance_exists(player) 
{
	if creator.object_index == player and other.hp<=0 //and other.hp+damage>0
	{
		player.kills+=1;
	}
	if other.object_index == player
	{
		if object_is_ancestor(creator.object_index, obj_enemy_parent)
		{
			add_screenshake(6,10)
		}
		if player.hp<=0
		{
			var number = sprite_get_number(s_skeleton_bones_strip10);
			instance_destroy(other);
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
		add_screenshake(2,5)
	}
}

ds_list_add(hit_objects,other);
other.state = "knockback";
other.knockback_speed = knockback*sign(image_xscale);
other.image_xscale = -sign(image_xscale);
//show_debug_message(other.hp)