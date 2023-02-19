/// @description Code

key_left = keyboard_check(ord("A")) + keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) + keyboard_check(vk_right);
key_jump = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down);

if (hasControl) {
	state();
} else {
	key_left = 0;
	key_right = 0;
	key_jump = false;
	key_down = false;
}
