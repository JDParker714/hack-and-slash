event_inherited();
random_lower = 1;
random_upper = 4;
state = "idle";
move_speed = 4;
image_xscale = choose(-1, 1);

alarm[2]=random_range(random_lower,random_upper)*room_speed;