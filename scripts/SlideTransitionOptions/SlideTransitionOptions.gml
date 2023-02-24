/// @desc SlideTransitionOptions(currentRoom)
/// @arg currentRoom sets the room to return to.

function SlideTransitionOptions(currentRoom){
	SlideTransistion(TRANS_MODE.GOTO, MenuOptions);
	with(oOptionsMenu) {
		originRoom = currentRoom;
	}
}