/// @description Draw Menu

gui_width = view_wport[0];
gui_height = view_hport[0];
gui_margin = 32;

menu_y = gui_height - gui_margin;
if (menu_committed == -1) {
	menu_x_target = gui_width - gui_margin;
}

draw_set_font(fMenu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i++) {
	
	var offset = 2;
	var txt = menu[i];
	
	if (menu_cursor == i) {
		txt = string_insert("> ", txt, 0);
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