// Enter State
if (state == 0) {
	timer++;
	
	// Change Room
	if (timer >= duration) {
		room_goto(target_room);
		
		// Set state
		state = 1;
	}
}

// Exit state
else if (state == 1) {
	timer--;
	
	//Destroy
	if (timer <= 0) {
		instance_destroy();
	}
}

// Set alpha
alpha = timer / duration;