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
	INTRO
}
mode = TRANS_MODE.INTRO;
percent = 1;
target = room;
in_menu = false;
played_transistion_sn = false;