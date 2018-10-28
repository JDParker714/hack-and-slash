draw_self();

switch(state) {
	case "dialogue":
		text = ds_list_find_value(dialogue, index);
		create_textbox(x, y-32, string_copy(text, 0, count));
		if(count < string_length(text)) {
			count++;
		}
		else sprite_set_state(spr_farmer_blink, .8, 0);
		break;
}
