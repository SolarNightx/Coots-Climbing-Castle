/// @description Progress the transition
w = view_wport[0];
h = view_hport[0];
h_half = h/2;

if (mode != TRANS_MODE.OFF) {
	if (mode == TRANS_MODE.INTRO) {
		percent = max(0, percent - max((percent/10), 0.005));
	} else {
		percent = min(1.2, percent + max(((1.2 - percent)/10), 0.005));
	}
	
	if (percent == 1.2) or (percent == 0) {
		switch (mode) {
			case TRANS_MODE.INTRO:
			{
				mode = TRANS_MODE.OFF;
				break;
			}
			case TRANS_MODE.NEXT:
			{
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}
			case TRANS_MODE.GOTO:
			{
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				break;
			}
			case TRANS_MODE.RESTART:
			{
				game_restart();
				break;
			}
		}
	}
}

if (view_wport[0] != min(browser_width, 1920) or view_hport[0] != min(browser_height, 1080)) scale_canvas(1920, 1080, browser_width, browser_height, true);

if (in_menu) {
	
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
			case 2: default: 
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
			case 0: game_end(); break;
		}
	}	
}