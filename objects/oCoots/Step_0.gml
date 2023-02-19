/// @description Code

key_left = keyboard_check(ord("A")) + keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) + keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up);

var move = key_right - key_left;

hsp = sign(move) * walksp;
vsp += grv;

if (place_meeting(x,y+1,oWall)) && (key_jump) {
	vsp = -8;
}

if (place_meeting(x+hsp, y, oWall)) {
	while (!place_meeting(x+sign(hsp),y,oWall)) {
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

if (place_meeting(x, y+vsp, oWall)) {
	while (!place_meeting(x,y+sign(vsp),oWall)) {
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;