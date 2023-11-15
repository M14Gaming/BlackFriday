draw_self();

//Damage flash
if (flashAlpha > 0) {
	// Activate flash shader
	shader_set(sh_flash);
	
	//Draw sprite in flash color and alpha
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashColor, flashAlpha);
	
	shader_reset();
}