//Zombie can act again
canAct = true;
//restart alarm
alarm[2] = 1;
path_delete(path);

//If tile is trapped, activate trap
if (field.tiles[currentTile[0]-1][currentTile[1]].trapped) {
	currentHP -= 1;
	flashAlpha = 1;
}

//If tile is wet, slip and fall
if (field.tiles[currentTile[0]-1][currentTile[1]].wet) {
	image_angle = 90;
	canAct = false;
	alarm[1] = 300;
}