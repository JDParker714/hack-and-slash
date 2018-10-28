///@arg speedArray

//GIT CHANGES

var xSpeed = argument0[0]
var ySpeed = argument0[1]


if place_meeting(x+xSpeed,y+ySpeed,obj_wall){

	var angle = 0;
	if place_meeting(x+xSpeed,y,obj_wall){
		xSpeed = 0
	}
	if place_meeting(x,y+ySpeed,obj_wall){
		ySpeed = 0
	}
	
}


x+=xSpeed;
y+=ySpeed;

return [xSpeed,ySpeed]


