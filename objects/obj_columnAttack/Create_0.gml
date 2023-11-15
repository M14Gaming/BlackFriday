//Set vertices of target column
currentTargetVerts[0] = field.tiles[field.numRows-1][currentTargetCol].corners[0];
currentTargetVerts[1] = field.tiles[field.numRows-1][currentTargetCol].corners[1];
currentTargetVerts[2] = field.tiles[0][currentTargetCol].corners[1];
currentTargetVerts[3] = field.tiles[0][currentTargetCol].corners[2];
currentTargetVerts[4] = field.tiles[field.numRows-1][currentTargetCol].corners[2];
currentTargetVerts[5] = field.tiles[field.numRows-1][currentTargetCol].corners[3];