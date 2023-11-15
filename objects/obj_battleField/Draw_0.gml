draw_self();

//For testing: draw field outline
for (var i = 0; i < 5; i++) {
	draw_line_width(vertices[i][0],vertices[i][1],vertices[i+1][0],vertices[i+1][1], 10);
}