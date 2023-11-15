//Set vertices of target column
currentTargetVerts[0] = field.tiles[field.numRows-1][currentTargetCol].corners[0];
currentTargetVerts[1] = field.tiles[field.numRows-1][currentTargetCol].corners[1];
currentTargetVerts[2] = field.tiles[0][currentTargetCol].corners[1];
currentTargetVerts[3] = field.tiles[0][currentTargetCol].corners[2];
currentTargetVerts[4] = field.tiles[field.numRows-1][currentTargetCol].corners[2];
currentTargetVerts[5] = field.tiles[field.numRows-1][currentTargetCol].corners[3];

//Initiate triangle points for collision detection
var tri1 = [currentTargetVerts[0],currentTargetVerts[1],currentTargetVerts[4]];
var tri2 = [currentTargetVerts[4],currentTargetVerts[5],currentTargetVerts[0]];
var tri3 = [currentTargetVerts[1],currentTargetVerts[2],currentTargetVerts[3]];
var tri4 = [currentTargetVerts[3],currentTargetVerts[4],currentTargetVerts[1]];
var triangles = [tri1,tri2,tri3,tri4];

//Select Target
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
	//Loop thru zombies
	for (var i = 0; i < instance_number(obj_zombie); i++)
	{
		//If zombie is in target column, damage it
		currentZombie = instance_find(obj_zombie,i);
		if (inTargetArea(currentZombie,triangles)) {
			currentZombie.currentHP -= 1;
			currentZombie.flashAlpha = 1;
		}
	}
	//End attack, destroy attack instance
	instance_destroy();
}