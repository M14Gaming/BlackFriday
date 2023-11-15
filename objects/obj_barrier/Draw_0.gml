draw_self();

//Highlight current target row
draw_set_color(c_green);
//Tell player to select row
draw_text_transformed(200, 200, "SELECT TARGET \n SPACE: CONFIRM", 3, 3, 0);
//Draw barrier
draw_line_width(currentTargetVerts[0][0],currentTargetVerts[0][1],currentTargetVerts[0][0],currentTargetVerts[0][1]-50,10);
draw_line_width(currentTargetVerts[1][0],currentTargetVerts[1][1],currentTargetVerts[1][0],currentTargetVerts[1][1]-50,10);
draw_line_width(currentTargetVerts[0][0],currentTargetVerts[0][1]-50,currentTargetVerts[1][0],currentTargetVerts[1][1]-50,10);