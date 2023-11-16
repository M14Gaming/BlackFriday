draw_self();

//If there are no zombies left, player wins the battle
if (!instance_exists(obj_zombie)) {
	//DIsplay victory text
	draw_text_transformed_color(window_get_width()/2,window_get_height()/2,"YOU WIN!!", 7, 7, 0, c_green, c_green, c_green, c_green, 1);
	//Return to previous room after 2 seconds
	if (alarm[0] < 1) {
		alarm[0] = 120;
	}
}

//If jaden is destroyed, player loses the battle
if (!instance_exists(obj_battleJaden)) {
	//DIsplay victory text
	draw_text_transformed_color(window_get_width()/2,window_get_height()/2,"lmao", 7, 7, 0, c_red, c_red, c_red, c_red, 1);
	//Return to previous room after 2 seconds
	if (alarm[0] < 1) {
		alarm[0] = 120;
	}
}