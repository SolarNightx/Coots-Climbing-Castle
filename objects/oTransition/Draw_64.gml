/// @description Draw black bars

if (mode != TRANS_MODE.OFF) {
	if (!played_transistion_sn) {
	    audio_play_sound(snNextScreen, 5, false);
		played_transistion_sn = true;
	}
	draw_set_color(c_black);
	draw_rectangle(0,0,w,percent*h_half,false);
	draw_rectangle(0,h,w,h-(percent*h_half),false);
} else {
	played_transistion_sn = false;
}

if (in_menu) {
	draw_set_font(fMenu);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	var offset = 2;
	var txt = "PAUSED";
	draw_set_color(c_black);
	draw_text((w/2)-offset,h/2,txt);
	draw_text((w/2)+offset,h/2,txt);
	draw_text(w/2,(h/2)-offset,txt);
	draw_text(w/2,(h/2)+offset,txt);
	draw_set_color(c_white);
	draw_text(w/2,h/2,txt);
}