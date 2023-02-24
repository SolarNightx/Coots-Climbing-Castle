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
	}
}

if (menu_committed != -1) {
	
	switch (menu_committed) {
		case 2: 
		{
			if (volume < 1 ) {
				volume += 0.1
				audio_master_gain(volume);
				audio_play_sound(snClick, 10, false);
			}
			menu_committed = -1;
			break;
		}
		case 1: 
		{
			if (volume > 0 ) {
				volume -= 0.1
				audio_master_gain(volume);
				audio_play_sound(snClick, 10, false);
			}
			menu_committed = -1;
			break;
		}
		case 0: default: SlideTransistion(TRANS_MODE.BACK); break;
	}
	
}