/// @function					generateZombies()
/// @param {Object} field		The battlefield for the current battle
/// @param {Object} enemyForms	The grid containig the zombies and their locations
/// @description				Generates the zombies for the current battle
function generateZombies(field, enemyForms) {
	//Loop thru grid rows and columns
	for (var i = 0; i < ds_grid_width(enemyForms); i++) {
		for(var j = 0; j < ds_grid_height(enemyForms); j++) {
			//Get current cell value
			var currentCell = ds_grid_get(enemyForms, i, j);
			
			//Proceed only if current cell is NOT empty
			if(currentCell != "") {
				//Split cell value into individual zombies
				var cellZombies = string_split(currentCell, "|");
			
				//Loop thru zombies
				for (var z = 0; z < array_length(cellZombies); z++) {
					//Get current zombie
					var currentZombie = "obj_" + cellZombies[z];
				
					//Spawn current zombie on the current tile
					var newZombie = spawnZombie(field.tiles[j][i], asset_get_index(currentZombie));
					newZombie.currentTile = [j, i];
				}
			}
			
		}
	}
}