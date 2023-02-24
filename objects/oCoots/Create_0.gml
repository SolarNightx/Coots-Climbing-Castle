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
scale = 2.5;
image_xscale = scale;
image_yscale = scale;

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
		if (place_meeting(x, y+1, oWall) or place_meeting(x, y+1, oWallSticky)) {
			jumpt = 12;
		}
		return 0;
	} else {
		return vspe;
	}
}

StateFree = function() {
	//show_debug_message("StateFree");
	var move = sign(key_right - key_left);

	if (place_meeting(x,y+1,oWall) or place_meeting(x,y+1,oWallSticky)) {
		hsp = move * walksp;
	} else {
		hsp += move / 18;
		hsp = clamp(hsp, -walksp, walksp)*0.99;
	}
	vsp += grv;
	
	if (key_jump) and (jumpt >= 0) {
		audio_play_sound(snJump, 5, false);
		vsp = -jumpsp;
		jumpt = -1;
	}
	jumpt--;

	hsp = checkCollisionX(hsp);
	x += hsp;

	vsp = checkCollisionY(vsp);
	if (vsp > vspmax) {
		vsp = vspmax;
	}
	y += vsp;
	
	// Animation
	if (!place_meeting(x, y+1, oWall) and !place_meeting(x, y+1, oWallSticky)) {
		if (vsp < 0) sprite_index = sCootsJumpUP; else sprite_index = sCootsJumpDOWN;
	} else {
		image_speed = 1;
		if (hsp == 0) {
			sprite_index = sCootsIdle;
		} else {
			sprite_index = sCootsRun;
		}
	}
	
	if (sign(hsp) != 0) {
		image_xscale = sign(hsp)*scale;
	}
	
	if (!place_meeting(x, y+1, oWall) and (place_meeting(x+sign(hsp), y, oWallSticky) or place_meeting(x+move, y, oWallSticky))) {
		image_speed = 1;
		sprite_index = sCootsWall;
		image_index = 2;
		state = StateWall;
	}
	
	if (!place_meeting(x, y+1, oWall) and place_meeting(x, y-1, oWallSticky)) {
		image_speed = 1;
		state = StateRoof;
	}
	
}

StateWall = function() {
	//show_debug_message("StateWall");
	if (key_down) {
		image_speed = 1;
		hsp = 0;
		vsp = 0;
		state = StateFree;
	}
	if (key_jump) {
		audio_play_sound(snJump, 5, false);
		image_speed = 1;
		if (place_meeting(x+1, y, oWallSticky)) {
			hsp = -pushsp;
		} else {
			hsp = pushsp;
		}
		if (sign(hsp) != 0) {
			image_xscale = sign(hsp)*scale;
		}
		vsp = -jumpsp;
		state = StateFree;
	}
	
	// Animation
	if (image_index >= 3) {
		image_speed = 0;
		image_index = 3;
	}
	
	
}

StateRoof = function() {
	//show_debug_message("StateRoof");
	image_yscale = -scale;
	while (place_meeting(x, y, oWallSticky)) {
		y ++;
	}
	
	if (key_down or !place_meeting(x, y-1, oWallSticky)) {
		hsp = 0;
		vsp = 1;
		image_yscale = scale;
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
		if (sign(hsp) != 0) {
			image_xscale = sign(hsp)*scale;
		}
		vsp = 1;
		image_yscale = scale;
		state = StateFree;
	}
	hsp = move * walksp / 2;
	hsp = checkCollisionX(hsp);
	x += hsp;
	
	// Animation
	if (image_index >= 5 or sprite_index != sCootsWall) {
		image_speed = 1;
		if (hsp == 0) {
			sprite_index = sCootsIdle;
		} else {
			sprite_index = sCootsRun;
		}
		if (sign(hsp) != 0) {
			image_xscale = sign(hsp)*scale;
		}
	}
	
}

state = StateFree;