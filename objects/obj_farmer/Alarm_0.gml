if not instance_exists(player) exit;

if player.x < x + 90 {
	state = "dialogue";
	sprite_set_state(spr_farmer_talking, 1, 0);
	alarm[1] = 150;
}