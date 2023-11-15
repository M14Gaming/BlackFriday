/// @function			startBattle()
/// @param {string} rm	Name of the room where the battle was triggered.
/// @description		Generates all assets and data needed for a battle.
function startBattle(rm){
	//Randomize seed
	randomize();
	
	var backLayer = layer_get_id("Background"); //Get ID of background layer
	var backLayerID = layer_background_get_id(backLayer); //Get ID of background
	
	var circleSize; //The size of Jaden's circle (scale of sprite size)
	
	var field = instance_create_layer(0, 0, "Field", obj_battleField); //Set variable for battlefield for readability
	var circle = obj_jadenBattleCircle;
	
	//Enemy formations
	var enemyForms;
	
	//Set vertices at Jaden's Circle
	field.vertices[0] = [circle.x, circle.y - 300]; // Left of circle
	field.vertices[5] = [circle.x + 500, circle.y]; // Right of circle

	
	//Generate battle field based on room where battle was triggered
	switch (rm) {
		case "rm_RPGTest":
			layer_background_sprite(backLayerID,spr_battleTestBG); //Display background
			//Set vertices of grid
			field.vertices[1] = [230, 450];
			field.vertices[2] = [1150, 240];
			field.vertices[3] = [1900, 370];
			field.vertices[4] = [1080, 860];
			
			//Set number of rows and columns
			field.numRows = 3;
			field.numCols = 3;
			
			//Load csv with enemy formations
			enemyForms = load_csv("test_room.csv");
		break;
	}
	
	//Generate tiles
	generateTiles(field);
	
	//Generate nodes (node system only)
	//generateNodes(field.tiles);
	
	//Generate zombies
	generateZombies2(field, enemyForms); //node system
}