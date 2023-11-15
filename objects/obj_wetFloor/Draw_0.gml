draw_self();

//Highlight current target tile
draw_set_color(c_green);
//Tell player to select row
draw_text_transformed(200, 200, "SELECT TARGET \n SPACE: CONFIRM", 3, 3, 0);
//Draw circle
draw_ellipse(currentTargetVerts[0][0],currentTargetVerts[1][1],currentTargetVerts[2][0],currentTargetVerts[3][1],false);