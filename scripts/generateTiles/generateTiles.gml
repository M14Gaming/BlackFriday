/// @function				generateTiles()
/// @param {Object} field	The battlefield where tiles will be placed
/// @description			Generates tiles on battlefield based on number of columns and rows
function generateTiles(field){
	var x1, y1, x2, y2, x3, y3, x4, y4;
	
	for (var i = 0; i < field.numRows; i++) { //Loop through rows
		for (var j = 0; j < field.numCols; j++) { //Loop through columns
			field.tiles[i][j] = instance_create_layer(0, 0, "Tiles", obj_tile); //Create tile
			
			//Generate tiles for last row (closest to Jaden) once that row is reached
			if (i == field.numRows - 1) {
				//Generate corner coordinates for tile
				
				//Bottom left
				x1 = lerp(field.vertices[0][0], field.vertices[5][0], j/field.numCols);
				y1 = lerp(field.vertices[0][1], field.vertices[5][1], j/field.numCols);
		
				//Top left
				x2 = lerp(field.vertices[1][0], field.vertices[4][0], j/field.numCols);
				y2 = lerp(field.vertices[1][1], field.vertices[4][1], j/field.numCols);
		
				//Top right
				x3 = lerp(field.vertices[1][0], field.vertices[4][0], (j+1)/field.numCols);
				y3 = lerp(field.vertices[1][1], field.vertices[4][1], (j+1)/field.numCols);
	
				//Bottom right
				x4 = lerp(field.vertices[0][0], field.vertices[5][0], (j+1)/field.numCols);
				y4 = lerp(field.vertices[0][1], field.vertices[5][1], (j+1)/field.numCols);
			}
			else {
				var gridRows = field.numRows - 1; //One less row than total in grid, last one is the one closest to Jaden
				
				//Find points on left and right edges of the battlefield
				var leftLength = point_distance(field.vertices[2][0],field.vertices[2][1],field.vertices[1][0],field.vertices[1][1]);
				var leftDir = point_direction(field.vertices[2][0],field.vertices[2][1],field.vertices[1][0],field.vertices[1][1]); //Direction from top to bottom
			
				var leftX1 = field.vertices[2][0] + lengthdir_x(leftLength * i/gridRows, leftDir);
				var leftY1 = field.vertices[2][1] + lengthdir_y(leftLength * i/gridRows, leftDir);
			
				var leftX2 = field.vertices[2][0] + lengthdir_x(leftLength * ((i+1)/gridRows), leftDir);
				var leftY2 = field.vertices[2][1] + lengthdir_y(leftLength * ((i+1)/gridRows), leftDir);


				var rightLength = point_distance(field.vertices[3][0],field.vertices[3][1],field.vertices[4][0],field.vertices[4][1]);
				var rightDir = point_direction(field.vertices[3][0],field.vertices[3][1],field.vertices[4][0],field.vertices[4][1]); //Direction from top to bottom
			
				var rightX1 = field.vertices[3][0] + lengthdir_x(rightLength * i/gridRows, rightDir);
				var rightY1 = field.vertices[3][1] + lengthdir_y(rightLength * i/gridRows, rightDir);
			
				var rightX2 = field.vertices[3][0] + lengthdir_x(rightLength * ((i+1)/gridRows), rightDir);
				var rightY2 = field.vertices[3][1] + lengthdir_y(rightLength * ((i+1)/gridRows), rightDir);
			
				//Set corners of tile
			
				//Bottom left
				x1 = lerp(leftX2, rightX2, j/field.numCols);
				y1 = lerp(leftY2, rightY2, j/field.numCols);
				
				//Top left
				x2 = lerp(leftX1, rightX1, j/field.numCols);
				y2 = lerp(leftY1, rightY1, j/field.numCols);
		
				//Top right
				x3 = lerp(leftX1, rightX1, (j+1)/field.numCols);
				y3 = lerp(leftY1, rightY1, (j+1)/field.numCols);
	
				//Bottom right
				x4 = lerp(leftX2, rightX2, (j+1)/field.numCols);
				y4 = lerp(leftY2, rightY2, (j+1)/field.numCols);
			}
			
			//Set corners of tile
			field.tiles[i][j].corners[0] = [x1, y1];
			field.tiles[i][j].corners[1] = [x2, y2];
			field.tiles[i][j].corners[2] = [x3, y3];
			field.tiles[i][j].corners[3] = [x4, y4];
		}
	}
}