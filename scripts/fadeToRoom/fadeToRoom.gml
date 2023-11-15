// @param room		
// @param duration
// @param color
function fadeToRoom(rm, dur, col) {
	var fade = instance_create_depth(0, 0, 0, obj_roomTransition);
	
	with (fade) {
		target_room = rm;
		duration = dur;
		color = col;
	}
}