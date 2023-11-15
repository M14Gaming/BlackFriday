//Layering
depth = -y;

//If an action is not currently taking place, game will accept inputs from player
if(alarm[0] > 0 or instance_exists(obj_attack)) {
	canAct = false;
}
else
{
	canAct = true;
}

//If player presses space bar, initiate tile attack
if (keyboard_check_pressed(vk_space) and canAct) {
	instance_create_layer(x, y, "Actions", obj_tileAttack);
}
//If player presses 1, initiate column attack
if (keyboard_check_pressed(ord(1)) and canAct) {
	instance_create_layer(x, y, "Actions", obj_columnAttack);
}
//If player presses 2, initiate row attack
if (keyboard_check_pressed(ord(2)) and canAct) {
	instance_create_layer(x, y, "Actions", obj_rowAttack);
}
//If player presses 3, initiate trap placement
if (keyboard_check_pressed(ord(3)) and canAct) {
	instance_create_layer(x, y, "Actions", obj_trap);
}
//If player presses 4, initiate floor mopping
if (keyboard_check_pressed(ord(4)) and canAct) {
	instance_create_layer(x, y, "Actions", obj_wetFloor);
}
//If player presses 5, initiate barrier placement
if (keyboard_check_pressed(ord(5)) and canAct) {
	instance_create_layer(x, y, "Actions", obj_barrier);
}

//Damage flash
if (flashAlpha > 0) {
	flashAlpha -= 0.05;
}