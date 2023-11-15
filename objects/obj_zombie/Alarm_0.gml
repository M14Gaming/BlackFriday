//Zombie actions (node style)

//Check if zombie is within attack range
if(field.numRows - currentTile[0] <= range and canAct) {
	obj_battleJaden.currentHP -= 1;
	alarm[0] = actSpeed;
}
//Check if zombie is at last row
else if(currentTile[0]+1 < field.numRows and canAct) {
	//Set destination tile
	var destTile;
	var destCoords;
	//If tile in front of zombie is blocked, move sideways instead
	if (field.tiles[currentTile[0]+1][currentTile[1]].blocked) {
		//Move right if on leftmost column
		if (currentTile[1] == 0) {
			destCoords = [currentTile[0],currentTile[1]+1];
			destTile = field.tiles[destCoords[0]][destCoords[1]];
		}
		//Move left if on rrightmost column
		else if (currentTile[1] == field.numCols-1) {
			destCoords = [currentTile[0],currentTile[1]-1];
			destTile = field.tiles[destCoords[0]][destCoords[1]];
		}
		else {
			//Randomly pick direction
			var dir = irandom_range(0,1);
			switch (dir) {
				case 0:
					destCoords = [currentTile[0],currentTile[1]-1];
					destTile = field.tiles[destCoords[0]][destCoords[1]];
				break;
				case 1:
					destCoords = [currentTile[0],currentTile[1]+1];
					destTile = field.tiles[destCoords[0]][destCoords[1]];
				break;
			}
		}
	}
	//If the tile in front is not blocked, move forward
	else {
		destCoords = [currentTile[0]+1,currentTile[1]];
		destTile = field.tiles[destCoords[0]][destCoords[1]];
	}
	
	//Set destination node (-1 if tile is full)
	var destNode = getFirstEmptyNode(destTile);

	//Check if destination tile has an available node
	if(destNode != -1) {
		//Creat path from current tile to next tile
		path = path_add();
		//Make it so path doesn't loop
		path_set_closed(path, false);
		//Set path points
		path_add_point(path,x,y,5); //Current tile
		path_add_point(path,destTile.nodes[destNode].x,destTile.nodes[destNode].y,5); //Destination tile
	
		//Move to destination tile
		path_start(path,movSpeed,path_action_stop,false);
		
		//Set current tile to empty
		field.tiles[currentTile[0]][currentTile[1]].nodes[currentNode].isEmpty = true;
		
		//Set destination node to be filled
		destTile.nodes[destNode].isEmpty = false;
	
		//Set destination tile and node as new current tile and node
		currentTile = destCoords;
		currentNode = destNode;
	}
	//If next tile is full, reset alarm
	else {
		alarm[0] = actSpeed;
	}
	
}