/// @description Insert description here
// You can write your code in this editor
if not instance_exists(obj_camera) exit;

layer_x("trees_close", obj_camera.x/4);
layer_x("trees_far", obj_camera.x/2);
layer_x("clouds", obj_camera.x/1.2);
if not instance_exists(obj_skeleton) exit;
var des_x  = obj_camera.x;
layer_x("background", camera_get_view_x(view_camera[0])-500);