event_inherited();

image_speed = 0.5;
depth = 1;

state = "move";
run_speed = 4;
roll_speed = 6;

input =  instance_create_layer(0,0,"Instances",obj_input);
kills = 0;

max_hp = 40;
hp = max_hp;
vspeed_ = 0;
move_h = 0;
hspeed_ = 0;
gravity_ = 1;
was_grounded = true;
wait_for_ground = true;
size = 1;
image_yscale = size;

draw_shader = false;
upixelH = shader_get_uniform(shader0,"pixelH")
upixelW = shader_get_uniform(shader0,"pixelW")
texelW = texture_get_texel_width(sprite_get_texture(sprite_index,0))
texelH = texture_get_texel_height(sprite_get_texture(sprite_index,0))

if !audio_is_playing(bovine_beat)
{
	audio_play_sound(bovine_beat, 1,true);
}