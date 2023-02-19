/// @description Move to next room

with (oCoots) {
	if (hasControl) {
		hasControl = false;
		SlideTransistion(TRANS_MODE.GOTO, other.target);
	}
}
