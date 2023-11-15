/// @function				getFirstEmptyNode()
/// @param {Object} tile	The tile to check
/// @description			Get the index of the first available node in a tile, returns null if tile is full 
function getFirstEmptyNode(tile){
	for(var i = 2; i >= 0; i--) {
		if(tile.nodes[i].isEmpty) {
			return i;
		}
	}
	return -1;
}