//Set vertices of target row
currentTargetVerts[0] = field.tiles[currentTargetRow][field.numCols-1].corners[2];
currentTargetVerts[1] = field.tiles[currentTargetRow][field.numCols-1].corners[3];
currentTargetVerts[2] = field.tiles[currentTargetRow][0].corners[0];
currentTargetVerts[3] = field.tiles[currentTargetRow][0].corners[1];

//Initiate triangle points for collision detection
var tri1 = [currentTargetVerts[0],currentTargetVerts[1],currentTargetVerts[2]];
var tri2 = [currentTargetVerts[2],currentTargetVerts[3],currentTargetVerts[0]];
var triangles = [tri1,tri2];

//Select Target
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

//Target confirmed, execute attack
if(keyboard_check_pressed(vk_space)) {
	//Loop thru zombies
	for (var i = 0; i < instance_number(obj_zombie); i++)
	{
		//If zombie is in target row, damage it
		currentZombie = instance_find(obj_zombie,i);
		if (inTargetArea(currentZombie,triangles)) {
			currentZombie.currentHP -= 1;
			currentZombie.flashAlpha = 1;
		}
	}
	//End attack, destroy attack instance
	instance_destroy();
}