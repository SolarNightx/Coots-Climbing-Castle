/// @description Draw Menu

gui_width = view_wport[0];
gui_height = view_hport[0];

menu_x = gui_width/2;
menu_y = gui_height/2;

draw_set_font(fMenu);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

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
draw_set_color(c_black);
draw_text((view_wport[0]/2)-offset,view_hport[0]/3,"Options");
draw_text((view_wport[0]/2)+offset,view_hport[0]/3,"Options");
draw_text(view_wport[0]/2,(view_hport[0]/3)-offset,"Options");
draw_text(view_wport[0]/2,(view_hport[0]/3)+offset,"Options");
draw_set_color(c_white);
draw_text(view_wport[0]/2,view_hport[0]/3,"Options");