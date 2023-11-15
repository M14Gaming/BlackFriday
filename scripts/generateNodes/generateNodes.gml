/// @function				generateNodes()
/// @param {Object} tiles	The artray of tiles where nodes will be placed
/// @description			Generates nodes on every tile of a battlefield
function generateNodes(tiles){
	var x1, y1, x2, y2, x3, y3;
	
	for (var i = 0; i < array_length(tiles); i++) { //Loop thru rows
		for (var j = 0; j < array_length(tiles[i]); j++) { //Loop thru columns
			var currentTile = tiles[i][j];
			var numCols = array_length(tiles[i])
			
			//Get length and angle of left and right sides of current tile
			var leftLength = point_distance(currentTile.corners[0][0],currentTile.corners[0][1],currentTile.corners[1][0],currentTile.corners[1][1]);
			var leftDir = point_direction(currentTile.corners[1][0],currentTile.corners[1][1],currentTile.corners[0][0],currentTile.corners[0][1]); //Direction from top to bottom
			
			var rightLength = point_distance(currentTile.corners[2][0],currentTile.corners[2][1],currentTile.corners[3][0],currentTile.corners[3][1]);
			var rightDir = point_direction(currentTile.corners[2][0],currentTile.corners[2][1],currentTile.corners[3][0],currentTile.corners[3][1]); //Direction from top to bottom
			
			//Generate tiles in arc shape in closest row to Jaden
			if(i == array_length(tiles)-1) {
				//Get distance between current column and half the number of columns
				var halfCols = floor(numCols/2);
				var distFromHalf = abs(halfCols-j);
				
				//Correction for left half columns in even number of columns
				if(numCols % 2 == 0 and j < halfCols) {
					distFromHalf -= 1;
				}
				
				//find points on left and right sides of current tile
				var leftX = currentTile.corners[1][0] + lengthdir_x(leftLength * (halfCols+distFromHalf)/numCols, leftDir);
				var leftY = currentTile.corners[1][1] + lengthdir_y(leftLength * (halfCols+distFromHalf)/numCols, leftDir);
				
				var rightX = currentTile.corners[2][0] + lengthdir_x(rightLength * (halfCols+distFromHalf)/numCols, rightDir);
				var rightY = currentTile.corners[2][1] + lengthdir_y(rightLength * (halfCols+distFromHalf)/numCols, rightDir);
				
				
				//Generate node coordinates
				
				//Left
				x1 = lerp(leftX, rightX, 1/4);
				y1 = lerp(leftY, rightY, 1/5);
				
				//Middle
				x3 = lerp(leftX, rightX, 2/4);
				y3 = lerp(leftY, rightY, 2/4);
				
				//Right
				x2 = lerp(leftX, rightX, 3/4);
				y2 = lerp(leftY, rightY, 3/4);
			}
			else {
				//Find points on left and right sides of the current tile
				var leftX1 = currentTile.corners[1][0] + lengthdir_x(leftLength * 1/4, leftDir);
				var leftY1 = currentTile.corners[1][1] + lengthdir_y(leftLength * 1/4, leftDir);
			
				var leftX2 = currentTile.corners[1][0] + lengthdir_x(leftLength * 3/4, leftDir);
				var leftY2 = currentTile.corners[1][1] + lengthdir_y(leftLength * 3/4, leftDir);
			
				var rightX1 = currentTile.corners[2][0] + lengthdir_x(rightLength * 1/4, rightDir);
				var rightY1 = currentTile.corners[2][1] + lengthdir_y(rightLength * 1/4, rightDir);
			
				var rightX2 = currentTile.corners[2][0] + lengthdir_x(rightLength * 3/4, rightDir);
				var rightY2 = currentTile.corners[2][1] + lengthdir_y(rightLength * 3/4, rightDir);
			
				//Generate node coordinates
			
				//Left
				x1 = lerp(leftX1, rightX1, 1/4);
				y1 = lerp(leftY1, rightY1, 1/4);
			
				//Right
				x2 = lerp(leftX1, rightX1, 3/4);
				y2 = lerp(leftY1, rightY1, 3/4);
			
				//Middle
				x3 = lerp(leftX2, rightX2, 2/4);
				y3 = lerp(leftY2, rightY2, 2/4);
			}
			
			//Generate nodes
			currentTile.nodes[0] = instance_create_layer(x1, y1, "Nodes", obj_node);
			currentTile.nodes[1] = instance_create_layer(x2, y2, "Nodes", obj_node);
			currentTile.nodes[2] = instance_create_layer(x3, y3, "Nodes", obj_node);
		}
	}
}