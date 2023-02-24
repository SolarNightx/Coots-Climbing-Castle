/// @description GUI/Vars/Menu setup
originRoom = 0;
volume = 1;

gui_width = view_wport[0];
gui_height = view_hport[0];

menu_x = gui_width/2;
menu_y = gui_height/2;
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
menu_committed = -1;
menu_control = true;

menu[2] = "Volume Up";
menu[1] = "Volume Down";
menu[0] = "Back";

menu_items = array_length(menu);
menu_cursor = 2;

music_started = false;
