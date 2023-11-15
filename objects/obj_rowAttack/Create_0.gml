//Initial target row is row closest to jaden
currentTargetRow = field.numRows-1;

//Set vertices of target row
currentTargetVerts[0] = field.tiles[currentTargetRow][field.numCols-1].corners[2];
currentTargetVerts[1] = field.tiles[currentTargetRow][field.numCols-1].corners[3];
currentTargetVerts[2] = field.tiles[currentTargetRow][0].corners[0];
currentTargetVerts[3] = field.tiles[currentTargetRow][0].corners[1];