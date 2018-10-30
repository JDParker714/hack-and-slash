event_inherited();
state = "chase";
hspeed_ = random_range(4,5);
if instance_exists(player)
{
	hspeed_ *= sign(player_hdirection);	
}
image_xscale = sign(hspeed_);