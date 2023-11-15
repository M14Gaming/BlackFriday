draw_self();

if(wet) {
	draw_set_color(c_blue);
	//Draw wet spot
	draw_ellipse(corners[0][0],corners[1][1],corners[2][0],corners[3][1],false);
}

if(trapped) {
	draw_set_color(c_red);
	//Draw trap
	draw_line_width(corners[0][0],corners[0][1],corners[2][0],corners[2][1],10);
	draw_line_width(corners[1][0],corners[1][1],corners[3][0],corners[3][1],10);
}

draw_set_color(c_white);

for (var i = 0; i < 3; i++) {
	draw_line_width(corners[i][0],corners[i][1],corners[i+1][0],corners[i+1][1], 10);
}

draw_line_width(corners[3][0],corners[3][1],corners[0][0],corners[0][1], 10);

if(blocked) {
	draw_set_color(c_orange);
	//Draw barrier
	draw_line_width(corners[1][0],corners[1][1],corners[1][0],corners[1][1]-50,10);
	draw_line_width(corners[2][0],corners[2][1],corners[2][0],corners[2][1]-50,10);
	draw_line_width(corners[1][0],corners[1][1]-50,corners[2][0],corners[2][1]-50,10);
}