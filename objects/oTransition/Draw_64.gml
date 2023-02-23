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
	for (var i = 0; i < menu_items; i++) {
	
		var offset = 2;
		var txt = menu[i];
	
		if (menu_cursor == i) {
			txt = string_insert("> ", txt, 0);
			txt = string_insert(" <", txt, string_length(txt)+1);
			var col = c_white;
		} else {
			var col = c_gray;
		}
	
		var xx = menu_x;
		var yy = menu_y - (menu_itemheight * (i * 1.5));
	
		draw_set_color(c_black);
		draw_text(xx-offset,yy,txt);
		draw_text(xx+offset,yy,txt);
		draw_text(xx,yy-offset,txt);
		draw_text(xx,yy+offset,txt);
		draw_set_color(col);
		draw_text(xx,yy,txt);
	
	}
	draw_set_font(fMenuLogo);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	var offset = 2;
	var txt = "PAUSED";
	draw_set_color(c_black);
	draw_text((w/2)-offset,h/3,txt);
	draw_text((w/2)+offset,h/3,txt);
	draw_text(w/2,(h/3)-offset,txt);
	draw_text(w/2,(h/3)+offset,txt);
	draw_set_color(c_white);
	draw_text(w/2,h/3,txt);
}