vngen_event_set_target();

if (vngen_event()) {

	vngen_text_create("text", "John Doe", "", 128, 900, 0, 1664, fnt_open_large, c_white, trans_slide_up, 0.2);
	
	vngen_textbox_create("textbox", spr_textbox, 0, 1080, 0, trans_slide_up, 0.2, ease_sin_out);
	
	vngen_do_auto(true, 0);

}

if (vngen_event()) {
	
	vngen_do_auto(false, 0);

	vngen_text_replace("text", previous, "It's a sign.", inherit, inherit, 0);
	
}

if (vngen_event()) {
	
	vngen_text_modify_style("text", c_green, c_green, c_gray, c_gray, c_black, c_black, 1, 0);
	
	vngen_text_replace("text", previous, "^[Welcum\nHAHA CUM]", inherit, inherit, 0);

}

if (vngen_event()) {
	
	vngen_text_modify_style("text", c_white, c_white, c_gray, c_gray, c_black, c_black, 1, 0);
	
	vngen_text_replace("text", previous, "...", inherit, inherit, 0);

}

if (vngen_event()) {
	
	vngen_text_modify_style("text", c_white, c_white, c_gray, c_gray, c_black, c_black, 1, 0);
	
	vngen_text_replace("text", previous, "I get the feeling whoever wrote this didn't spend very long on it.", inherit, inherit, 0);

}

if (vngen_event()) {

   vngen_text_destroy("text", trans_none, 0);
   
   vngen_textbox_destroy("textbox", trans_slide_up, 0.5, ease_sin_out);
}


if (vngen_event()) {

	vngen_object_clear(true);
	
}

vngen_event_reset_target();