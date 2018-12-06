/// @description Insert description here
// You can write your code in this editor
hspeed_ = 4*sign(obj_skeleton.image_xscale);
gravity_ = 1;
friction_ = 0.1;
vspeed_ = -5;
alive = true;
move = true;

angular_speed = -3.75*sign(obj_skeleton.image_xscale);
target_angle = image_angle + 90 * sign(angular_speed);