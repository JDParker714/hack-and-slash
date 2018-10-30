event_inherited();
if not instance_exists(player) exit;
speed = 3;
depth = -1;
image_xscale = sign(speed);
direction = point_direction(x, y, player.x, player.y - 15);
hp = 1;
max_hp = 1;

damage = 4;
hit = false;