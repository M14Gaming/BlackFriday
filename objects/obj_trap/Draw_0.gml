draw_self();

//Highlight current target tile
draw_set_color(c_green);
//Tell player to select tile
draw_text_transformed(200, 200, "SELECT TARGET \n SPACE: CONFIRM", 3, 3, 0);
//Draw X to show current tile
draw_line_width(currentTargetVerts[0][0],currentTargetVerts[0][1],currentTargetVerts[2][0],currentTargetVerts[2][1],10);
draw_line_width(currentTargetVerts[1][0],currentTargetVerts[1][1],currentTargetVerts[3][0],currentTargetVerts[3][1],10);