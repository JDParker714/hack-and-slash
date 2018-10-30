event_inherited();
if place_meeting(x,y,player) and player.state == "move"
{
	create_hitbox(x,y,self,sprite_index,4,1,damage,-image_xscale);
}