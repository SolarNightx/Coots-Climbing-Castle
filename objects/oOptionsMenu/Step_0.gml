/// @description Control Menu

//Keyboard Controls
if (menu_control) {
	
	if (keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up)) {
		audio_play_sound(snSelect, 5, false);
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down)) {
		audio_play_sound(snSelect, 5, false);
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	
	if (keyboard_check_pressed(vk_enter)) {
		menu_committed = menu_cursor;
		menu_control = false;
	}
}

if (menu_committed != -1) {
	
	if (!music_started) {
	    audio_play_sound(snMusicBG, 100, true);
		music_started = true;
	}
	switch (menu_committed) {
		case 2: 
		{
			with (oCoots) {
				if (!hasControl) {
					hasControl = true;
				}
			}
			in_menu = false;
			menu_committed = -1;
			break;
		}
		case 1: 
		{
			SlideTransitionOptions(room);
			menu_committed = -1;
			break;
		}
		case 0: default: SlideTransistion(TRANS_MODE.GOTO, originRoom); break;
	}
	
}