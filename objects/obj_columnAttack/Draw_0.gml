draw_self();

//Highlight current target column
draw_set_color(c_green);
//Tell player to select column
draw_text_transformed(200, 200, "<- SELECT TARGET -> \n SPACE: CONFIRM", 3, 3, 0);
draw_primitive_begin(pr_trianglelist);
//Triangle 1
draw_vertex(currentTargetVerts[0][0],currentTargetVerts[0][1]);
draw_vertex(currentTargetVerts[1][0],currentTargetVerts[1][1]);
draw_vertex(currentTargetVerts[4][0],currentTargetVerts[4][1]);
//Triangle 2
draw_vertex(currentTargetVerts[4][0],currentTargetVerts[4][1]);
draw_vertex(currentTargetVerts[5][0],currentTargetVerts[5][1]);
draw_vertex(currentTargetVerts[0][0],currentTargetVerts[0][1]);
//Triangle 3
draw_vertex(currentTargetVerts[1][0],currentTargetVerts[1][1]);
draw_vertex(currentTargetVerts[2][0],currentTargetVerts[2][1]);
draw_vertex(currentTargetVerts[3][0],currentTargetVerts[3][1]);
//Triangle 4
draw_vertex(currentTargetVerts[3][0],currentTargetVerts[3][1]);
draw_vertex(currentTargetVerts[4][0],currentTargetVerts[4][1]);
draw_vertex(currentTargetVerts[1][0],currentTargetVerts[1][1]);
draw_primitive_end();
