//Zombie actions

//Check if zombie is able to act
if (canAct) {
	//Check if zombie is within attack range
	if(field.numRows - currentTile[0] <= range and alarm[3] < 0) {
		alarm[3] = actSpeed;
	}

	else {
		//Zombie can no longer act until movement is complete
		canAct = false;
		
		//If zombie is at last row, move to position close to Jaden's circle
		if (currentTile[0]+1 >= field.numRows) {	
			//Get point around circle between zombie and circle position
			var circle = obj_jadenBattleCircle;
	
			//Get angle and distance from current point to destination point
			var angle = point_direction(x, y, circle.x, circle.y);
			var dist = point_distance(x, y, circle.x, circle.y);
	
			//Set destination point
			var destPosX = x + lengthdir_x(dist, angle);
			var destPosY = y + lengthdir_y(dist, angle);
	
			currentTile = [currentTile[0]+1, currentTile[1]];
		}

		//Move to next position on grid
		else {
			//Set destination tile
			var destTile;
			var destCoords;
	
			//If tile in front of zombie is blocked, move sideways instead
			if (field.tiles[currentTile[0]][currentTile[1]].blocked) {
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
	
			var destPosX = lerp(destTile.corners[1][0],destTile.corners[2][0],position);
			var destPosY = lerp(destTile.corners[1][1],destTile.corners[2][1],position);
	
			//Set destination tile and node as new current tile and node
			currentTile = destCoords;
		}

		//Creat path from current point to next point
		path = path_add();
		//Make it so path doesn't loop
		path_set_closed(path, false);
		//Set path points
		path_add_point(path,x,y,5); //Current point
		path_add_point(path,destPosX,destPosY,5); //Destination point
	
		//Move to destination point
		path_start(path,movSpeed,path_action_stop,false);
	}
}