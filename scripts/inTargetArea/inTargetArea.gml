/// @function					inTargetArea()
/// @param {string} zombie		The zombie that will be checked
/// @param {string} targetArea	The target area of the attack, a set of triangle points
/// @description				Checks if a given zombie is in target area of an attack
function inTargetArea(zombie, targetArea) {
	// Loop thru triangles
	for (i = 0; i < array_length(targetArea); i++) {
		// Check if zombie is in current triangle
		if (point_in_triangle(zombie.x,zombie.y,targetArea[i][0][0],targetArea[i][0][1],targetArea[i][1][0],targetArea[i][1][1],targetArea[i][2][0],targetArea[i][2][1])) {
			return true;
		}
	}
	return false; // Zombie is not in any of the triangles
}