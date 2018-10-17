if not instance_exists(player) {
	exit;
}
dist_to_player = point_distance(x,y,player.x,player.y);
player_hdirection = sign(player.x-x);