/// @description Code

hsp = 0;
vsp = 0;
grv = 0.1;
walksp = 4;
jumpsp = -8;
pushsp = 10;

StateFree = function() {
	var move = key_right - key_left;

	if (place_meeting(x,y+1,oWall)) {
		hsp = sign(move) * walksp;
	} else {
		hsp += sign(move) / 4;
		hsp = clamp(hsp, -walksp, walksp)*0.99;
	}
	vsp += grv;

	if (place_meeting(x,y+1,oWall)) && (key_jump) {
		vsp = jumpsp;
	}
	
	if (!place_meeting(x, y+1, oWall) and place_meeting(x+sign(hsp), y, oWallSticky)) {
		state = StateWall;
	}

	if (place_meeting(x+hsp, y, oWall) or place_meeting(x+hsp, y, oWallSticky)) {
		while (!place_meeting(x+sign(hsp),y,oWall) and !place_meeting(x+sign(hsp),y,oWallSticky)) {
			x += sign(hsp);
		}
		hsp = 0;
	}
	x += hsp;

	if (place_meeting(x, y+vsp, oWall) or place_meeting(x, y+vsp, oWallSticky)) {
		while (!place_meeting(x,y+sign(vsp),oWall) and !place_meeting(x,y+sign(vsp),oWallSticky)) {
			y += sign(vsp);
		}
		vsp = 0;
	}
	y += vsp;
}

StateWall = function() {
	if (key_down) {
		hsp = 0;
		vsp = 0;
		state = StateFree;
	}
	if (key_jump) {
		if (place_meeting(x+1, y, oWallSticky)) {
			hsp = -pushsp;
		} else {
			hsp = pushsp;
		}
		vsp = jumpsp;
		state = StateFree;
	}
}

state = StateFree;