//Set vertices of target row and column
currentTargetVerts[0] = field.tiles[currentTargetRow][currentTargetCol].corners[1];
currentTargetVerts[1] = field.tiles[currentTargetRow][currentTargetCol].corners[2];

//Select Target

//Change row
if(keyboard_check_pressed(vk_up)) {
	//If at edge of field, loop to other side
	if (currentTargetRow == 0) {
		currentTargetRow = field.numRows-1;
	}
	//Otherwise, move one row up
	else {
		currentTargetRow -= 1;
	}
}

if(keyboard_check_pressed(vk_down)) {
	//If at edge of field, loop to other side
	if (currentTargetRow == field.numRows-1) {
		currentTargetRow = 0;
	}
	//Otherwise, move one row down
	else {
		currentTargetRow += 1;
	}
}

//Change column
if(keyboard_check_pressed(vk_right)) {
	//If at edge of field, loop to other side
	if (currentTargetCol == field.numCols-1) {
		currentTargetCol = 0;
	}
	//Otherwise, move one column to the right
	else {
		currentTargetCol += 1;
	}
}

if(keyboard_check_pressed(vk_left)) {
	//If at edge of field, loop to other side
	if (currentTargetCol == 0) {
		currentTargetCol = field.numCols-1;
	}
	//Otherwise, move one column to the left
	else {
		currentTargetCol -= 1;
	}
}

//Target confirmed, execute attack
if(keyboard_check_pressed(vk_space)) {
	//Set barrier
	field.tiles[currentTargetRow][currentTargetCol].blocked = true;
	//End attack, destroy attack instance
	instance_destroy();
}