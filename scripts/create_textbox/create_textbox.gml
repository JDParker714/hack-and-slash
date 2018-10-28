///@arg x_position
///@arg y_position
///@arg text
var x_position = argument0;
var y_position = argument1;
var text = argument2;

draw_sprite(spr_textbox, 0, x_position, y_position);
draw_set_font(dialogue_font);
draw_text(x_position-45, y_position-48, text);