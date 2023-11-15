//Examined by Player
if (keyboard_check_pressed(vk_space) and distance_to_object(obj_RPGTestPlayer) == 0 and (x == obj_RPGTestPlayer.x or y == obj_RPGTestPlayer.y) and !instance_exists(script_WelcumSign)) {
		instance_create_layer(0, 0, "Visual_Novel", script_WelcumSign);
}