/// @function				spawnZombie2()
/// @param {Object} tile	The tile where the zombie will be placed
/// @param {Object} zombie	The zombie that will be placed
/// @param {Object} pos		The position between corners that the zombie will be placed
/// @description			Creates a zombie instance at a given tile (PvZ style)
function spawnZombie2(tile, zombie, pos){
	//Calculate spawn point
	var spawnX = lerp(tile.corners[1][0],tile.corners[2][0],pos);
	var spawnY = lerp(tile.corners[1][1],tile.corners[2][1],pos);
	
	//Create new zombie
	var newZombie = instance_create_layer(spawnX,spawnY,"Zombies",obj_zombie);
	
	return newZombie;
}