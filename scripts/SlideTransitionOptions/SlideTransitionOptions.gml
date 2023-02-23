/// @desc SlideTransitionOptions(currentRoom)
/// @arg currentRoom sets the room to return to.

function SlideTransitionOptions(){
	SlideTransistion(TRANS_MODE.GOTO, MenuOptions);
	with(oOptionsMenu) {
		originRoom = argument0;
	}
}