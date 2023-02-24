/// @description Pauses Game

if (room = Menu) {
	game_end();
} else if (room = MenuOptions) {
	with (oOptionsMenu) {
		menu_committed = 0;
	}
} else if (room != End and !in_menu) {
	with (oCoots) {
		if (hasControl) {
			hasControl = false;
		}
	}
	in_menu = true;
} else if (room != End and in_menu) {
	with (oCoots) {
		if (!hasControl) {
			hasControl = true;
		}
	}
	in_menu = false;
}