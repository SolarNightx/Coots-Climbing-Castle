/// @description Size variables and mode setup

w = browser_width;
h = browser_height;
h_half = h/2;
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO,
	BACK
}
mode = TRANS_MODE.INTRO;
percent = 1;
prevRoom = room;
target = room;
in_menu = false;
played_transistion_sn = false;

gui_width = view_wport[0];
gui_height = view_hport[0];

menu_x = gui_width/2;
menu_y = gui_height/2;
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
menu_committed = -1;

menu[2] = "Resume";
menu[1] = "Options";
menu[0] = "Quit";

menu_items = array_length(menu);
menu_cursor = 2;