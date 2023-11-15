//Initial target row is row closest to jaden
currentTargetRow = field.numRows-1;

//Set vertices of target row and column
currentTargetVerts[0] = field.tiles[currentTargetRow][currentTargetCol].corners[1];
currentTargetVerts[1] = field.tiles[currentTargetRow][currentTargetCol].corners[2];