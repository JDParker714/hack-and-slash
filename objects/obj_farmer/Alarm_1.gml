index++;
if index < ds_list_size(dialogue) {
	state = "dialogue";
	sprite_set_state(spr_farmer_talking, 1, 0);
	count = 0;
	alarm[1] = 200;
} else {
	state = "idle";
}


