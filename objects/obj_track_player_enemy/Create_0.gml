event_inherited();
player = obj_skeleton;

if not instance_exists(player) {
	exit;
}
player_hdirection = sign(player.x-x);
player_vdirection = sign(player.y-y);