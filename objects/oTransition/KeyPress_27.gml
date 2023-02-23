/// @description Pauses Game

show_debug_message(in_menu);
show_debug_message(room);

if (room = Menu) {
	game_end();
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