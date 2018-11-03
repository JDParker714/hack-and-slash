x += hspeed_ * image_xscale;
y -= vspeed_;

if not instance_exists(player) exit;

if place_meeting(x,y,player) and player.state == "move" and !hit
{
	create_hitbox(x,y,self,sprite_index,4,1,damage,image_xscale);
	hit = true;
	sprite_set_state(spr_explosion, 1, 0);
}

vspeed_ -= gravity_;