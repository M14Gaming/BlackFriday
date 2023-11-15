//Display Jaden's HP
draw_text_ext_transformed_color(20, 20, "Jaden: " + string(currentHP) + "/" + string(maxHP), 1, 500, 2, 2, 0, c_black, c_black, c_black, c_black, 1);

//Display Attack Prompt
draw_text_ext_transformed_color(0, 100, "Space: Tile Attack " + string(alarm[0]), 1, 500, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
//Briefly flash when attack button is pressed
if(keyboard_check_pressed(vk_space) and canAct) {
	draw_rectangle_color(300, 100, 350, 150, c_green, c_green, c_green, c_green, false);
}

draw_text_ext_transformed_color(0, 125, "1: Column Attack " + string(alarm[0]), 1, 500, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
//Briefly flash when attack button is pressed
if(keyboard_check_pressed(ord(1)) and canAct) {
	draw_rectangle_color(300, 125, 350, 175, c_green, c_green, c_green, c_green, false);
}

draw_text_ext_transformed_color(0, 150, "2: Row Attack " + string(alarm[0]), 1, 500, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
//Briefly flash when attack button is pressed
if(keyboard_check_pressed(ord(2)) and canAct) {
	draw_rectangle_color(300, 150, 350, 175, c_green, c_green, c_green, c_green, false);
}

draw_text_ext_transformed_color(0, 175, "3: Set Trap " + string(alarm[0]), 1, 500, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
//Briefly flash when attack button is pressed
if(keyboard_check_pressed(ord(3)) and canAct) {
	draw_rectangle_color(300, 175, 350, 200, c_green, c_green, c_green, c_green, false);
}

draw_text_ext_transformed_color(0, 200, "4: Mop Floor " + string(alarm[0]), 1, 500, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
//Briefly flash when attack button is pressed
if(keyboard_check_pressed(ord(4)) and canAct) {
	draw_rectangle_color(300, 200, 350, 225, c_green, c_green, c_green, c_green, false);
}

draw_text_ext_transformed_color(0, 225, "5: Place Barrier " + string(alarm[0]), 1, 500, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
//Briefly flash when attack button is pressed
if(keyboard_check_pressed(ord(5)) and canAct) {
	draw_rectangle_color(300, 225, 350, 250, c_green, c_green, c_green, c_green, false);
}