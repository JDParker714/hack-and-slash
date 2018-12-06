/// @description Draws health bar

draw_self();
x_off = -15;
y_off = -48;
hp_width = 30;
hp_height = 4;
outline = 1;
percent = (hp)/max_hp;
if show_hp>0 and hp > 0
{
	draw_rectangle_color(x+x_off-outline,y+y_off-outline,x+x_off+outline+(hp_width),y+y_off+outline+hp_height,c_black,c_black,c_black,c_black,false)
	draw_rectangle_color(x+x_off,y+y_off,x+x_off+(hp_width),y+y_off+hp_height,c_gray,c_gray,c_gray,c_gray,false)
	draw_rectangle_color(x+x_off,y+y_off,x+x_off+(hp_width*percent),y+y_off+hp_height,c_white,c_white,c_white,c_white,false)
}
if show_hp > 0 and hp <= 0
{
	draw_rectangle_color(x+x_off-outline,y+y_off-outline,x+x_off+outline+(hp_width),y+y_off+outline+hp_height,c_black,c_black,c_black,c_black,false)
	draw_rectangle_color(x+x_off,y+y_off,x+x_off+(hp_width),y+y_off+hp_height,c_gray,c_gray,c_gray,c_gray,false)
}