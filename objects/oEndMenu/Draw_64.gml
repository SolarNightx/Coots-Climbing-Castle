/// @description Code

draw_set_font(fMenuLogo);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_black);
draw_text((view_wport[0]/2)-offset,view_hport[0]/3,"You Win!");
draw_text((view_wport[0]/2)+offset,view_hport[0]/3,"You Win!");
draw_text(view_wport[0]/2,(view_hport[0]/3)-offset,"You Win!");
draw_text(view_wport[0]/2,(view_hport[0]/3)+offset,"You Win!");
draw_set_color(c_white);
draw_text(view_wport[0]/2,view_hport[0]/3,"You Win!");