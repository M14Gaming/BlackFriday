//Attack Jaden, if he's still alive
if (instance_exists(obj_battleJaden)) {
	obj_battleJaden.currentHP -= 1;
	obj_battleJaden.flashAlpha = 1;
}
alarm[2] = 1;
