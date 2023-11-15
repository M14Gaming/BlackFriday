//Layering
depth = -y;

//When HP reaches 0, zombie is killed
if (currentHP <= 0) {
	instance_destroy();
}

//If zombie has reached jaden's circle, stop moving
if(place_meeting(x,y,obj_jadenBattleCircle)) {
	path_end(); //Note: this will NOT trigger the "Path Ended" event
	canAct = true;
	alarm[2] = 1;
	reachedCircle = true;
}

//Damage flash
if (flashAlpha > 0) {
	flashAlpha -= 0.05;
}