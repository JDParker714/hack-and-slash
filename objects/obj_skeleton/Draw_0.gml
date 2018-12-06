/// @description Insert description here
// You can write your code in this editor
if draw_shader
{
	shader_set(shader0);
	shader_set_uniform_f(upixelW,texelW);
	shader_set_uniform_f(upixelH,texelH);
	draw_self();
	shader_reset();
}
else
{
	draw_self()
}