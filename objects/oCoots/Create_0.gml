/// @description Code

hasControl = true;
hsp = 0;
vsp = 0;
grv = 0.2;
walksp = 4;
jumpsp = 10;
jumpt = 10;
pushsp = 10;
vspmax = 0.2 * game_get_speed(gamespeed_fps) * 0.5;

function checkCollisionX(hspe) {
	if (place_meeting(x+hspe, y, oWall) or place_meeting(x+hspe, y, oWallSticky)) {
		while (!place_meeting(x+sign(hspe),y,oWall) and !place_meeting(x+sign(hspe),y,oWallSticky)) {
			x += sign(hspe);
		}
		return 0;
	} else {
		return hspe;
	}
}

function checkCollisionY(vspe) {
	if (place_meeting(x, y+vspe, oWall) or place_meeting(x, y+vspe, oWallSticky)) {
		while (!place_meeting(x,y+sign(vspe),oWall) and !place_meeting(x,y+sign(vspe),oWallSticky)) {
			y += sign(vspe);
		}
		jumpt = 12;
		return 0;
	} else {
		return vspe;
	}
}

StateFree = function() {
	show_debug_message("StateFree");
	var move = sign(key_right - key_left);

	if (place_meeting(x,y+1,oWall) or place_meeting(x,y+1,oWallSticky)) {
		hsp = move * walksp;
	} else {
		hsp += move / 12;
		hsp = clamp(hsp, -walksp, walksp)*0.99;
	}
	vsp += grv;
	
	if (key_jump) and (jumpt >= 0) {
		audio_play_sound(snJump, 5, false);
		vsp = -jumpsp;
		jumpt = -1;
	}
	jumpt--;
	
	if (!place_meeting(x, y+1, oWall) and place_meeting(x+sign(hsp), y, oWallSticky)) {
		state = StateWall;
	}

	hsp = checkCollisionX(hsp);
	x += hsp;

	vsp = checkCollisionY(vsp);
	if (vsp > vspmax) {
		vsp = vspmax;
	}
	y += vsp;
	
	if (!place_meeting(x, y+1, oWall) and place_meeting(x, y-1, oWallSticky)) {
		state = StateRoof;
	}
}

StateWall = function() {
	show_debug_message("StateWall");
	if (key_down) {
		hsp = 0;
		vsp = 0;
		state = StateFree;
	}
	if (key_jump) {
		audio_play_sound(snJump, 5, false);
		if (place_meeting(x+1, y, oWallSticky)) {
			hsp = -pushsp;
		} else {
			hsp = pushsp;
		}
		vsp = -jumpsp;
		state = StateFree;
	}
}

StateRoof = function() {
	show_debug_message("StateRoof");
	if (key_down or !place_meeting(x, y-1, oWallSticky)) {
		hsp = 0;
		vsp = 1;
		state = StateFree;
	}
	var move = sign(key_right - key_left);
	if (key_jump) {
		audio_play_sound(snJump, 5, false);
		if (move < 0) {
			hsp = -pushsp;
		} else if (move > 0) {
			hsp = pushsp;
		} else {
			hsp = 0;
		}
		vsp = 1;
		state = StateFree;
	}
	hsp = move * walksp / 2;
	hsp = checkCollisionX(hsp);
	x += hsp;
}

state = StateFree;