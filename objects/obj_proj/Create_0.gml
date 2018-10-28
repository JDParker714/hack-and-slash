if not instance_exists(obj_skeleton) exit;
speed = 3;
depth = -1;
image_xscale = sign(speed);
direction = point_direction(x, y, obj_skeleton.x, obj_skeleton.y);