/// @function				spawnZombie()
/// @param {Object} tile	The tile where the zombie will be placed
/// @param {Object} zombie	The zombie that will be placed
/// @description			Creates a zombie instance at a given tile, at the first available node
function spawnZombie(tile, zombie){
	//Check each node to find the first free one
	for(var i = 2; i >= 0; i--) {
		//Check if current node is empty
		if (tile.nodes[i].isEmpty == true) {
			//Create zombie instance
			var newZombie = instance_create_layer(tile.nodes[i].x, tile.nodes[i].y, "Zombies", zombie);
			//Node is no longer empty
			tile.nodes[i].isEmpty = false;
			//Set zombie node
			newZombie.currentNode = i;
			//Break loop
			return newZombie;
		}
	}
	
}