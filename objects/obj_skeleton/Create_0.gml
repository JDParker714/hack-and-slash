event_inherited();

image_speed = 0.5;
depth = 1;

state = "move";

maxRun_speed = 4;
roll_speed = 5;

//0 refers to x; 1 refers to y
curr_speed[0] = 0;
curr_speed[1] = 0;

//Forces
windSpeed = 2.5;
gravity_ = 1;
jump_force = 8;

//Speeds (dont use these)
curr_runSpeed = 0;
curr_windSpeed = 0;
curr_gravitySpeed = 0;
curr_jumpSpeed = 0;

animation_speedScale = 0.125;

input =  instance_create_layer(0,0,"Instances",obj_input);
kills = 0;

max_hp = 40;
hp = max_hp;
vspeed_ = 0;
move_h = 0;
hspeed_ = 0;

was_grounded = true;
gravity_isOn = true;