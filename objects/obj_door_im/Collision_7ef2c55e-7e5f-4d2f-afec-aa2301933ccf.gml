/// @description Insert description here
// You can write your code in this editor
if not instance_exists(other.creator) exit;
if other.creator==noone
{
	exit;
}
if other.creator.object_index==obj_skeleton
{
	instance_change(obj_door_m,true);	
}