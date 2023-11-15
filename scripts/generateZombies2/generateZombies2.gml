/// @function					generateZombies2()
/// @param {Object} field		The battlefield for the current battle
/// @param {Object} enemyForms	The grid containig the zombies and their locations
/// @description				Generates the zombies for the current battle (PvZ style)
function generateZombies2(field, enemyForms) {
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
					
					//Choose random point between top corners of tile
					var pos = random_range(0,1);
				
					//Spawn current zombie on the current tile
					var newZombie = spawnZombie2(field.tiles[j][i], asset_get_index(currentZombie),pos);
					newZombie.currentTile = [j, i];
					newZombie.position = pos;
				}
			}
			
		}
	}
}