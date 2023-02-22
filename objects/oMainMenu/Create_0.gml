/// @description GUI/Vars/Menu setup

gui_width = view_wport[0];
gui_height = view_hport[0];
gui_margin = 32;

menu_x = gui_width + 200;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 25; // Lower is faster
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
menu_committed = -1;
menu_control = true;

menu[2] = "Play";
menu[1] = "Options";
menu[0] = "Quit";

menu_items = array_length(menu);
menu_cursor = 2;