vngen_event_set_target();

if (vngen_event()) {

	vngen_text_create("text", "John Doe", "", 128, 900, 0, 1664, fnt_open_large, c_white, trans_slide_up, 0.5);
	
	vngen_do_auto(toggle, 0);

}

if (vngen_event("test_event")) {
	
   vngen_do_auto(false, 0);
	
   vngen_scene_create("bg", spr_scene_classic, 0, 0, 0, false, false, trans_fade, 2);
   
   vngen_event_pause(2);
   
   vngen_char_create("John Doe", spr_robot_body, spr_robot_idle, spr_robot_talk, 0, 1080, 0, 225, 100, false, trans_slide_right, 0.5, ease_sin_out);
   
   vngen_textbox_create("textbox", spr_textbox, 0, 1080, 0, trans_slide_up, 0.5);
   
   vngen_label_create("label", auto, 100, 750, -1, 384, fnt_open_large, c_white, trans_slide_right, 0.5);
   
   vngen_label_modify_style("label", c_white, c_white, c_blue, c_blue, c_black, c_black, 1, 2);

   vngen_text_replace("text", previous, "Hello, world!", inherit, inherit, 0);

   vngen_text_modify_style("text", c_white, c_white, c_gray, c_gray, c_black, c_black, 1, 2);

}

if (vngen_event()) {

   vngen_text_replace("text", previous, "How are you?", inherit, inherit, 0);

}

if (vngen_event()) {

	vngen_char_create("Jane Doe", spr_robot_body, spr_robot_idle, spr_robot_talk, 1920, 1080, 0, 225, 100, true, trans_slide_left, 0.5, ease_sin_out);

	vngen_text_replace("text", "Jane Doe", "I'm good, thanks! How about you?", previous, previous, 0);

}

if (vngen_event()) {

   if (vngen_option("options", 960, 540, 0, 0, snd_hover, snd_select)) {
   
      vngen_option_create("option_good", "I'm doing great!", spr_option_default, spr_option_hover, spr_option_select, 0, 0, -1, fnt_open_large, c_white, trans_slide_right, 1);
      
      vngen_option_create("option_bad", "Well...", spr_option_default, spr_option_hover, spr_option_select, 0, 100, -2, fnt_open_large, c_white, trans_slide_right, 1);  
   
   }
}

switch (vngen_get_option()) {
   
   case "option_good": vngen_goto("event_good"); break;
      
   case "option_bad": vngen_goto("event_bad"); break;
      
}

if (vngen_event("event_good")) {

   vngen_text_replace("text", "John Doe", "I'm doing great!", inherit, inherit, 0);

}

if (vngen_event()) {
   
   vngen_script_execute(vngen_goto, "event_complete");
   
}

if (vngen_event("event_bad")) {

   vngen_text_replace("text", "John Doe", "Not so great, I'm afraid...", inherit, inherit, 0);
   
}

if (vngen_event("event_complete")) {

   vngen_text_replace("text", "Jane Doe", "I see.", inherit, inherit, 0);
   
}

if (vngen_event()) {

   vngen_text_destroy("text", trans_none, 0);
   
   vngen_char_destroy("John Doe", trans_slide_right, 0.5, ease_sin_out);
   
   vngen_char_destroy("Jane Doe", trans_slide_left, 0.5, ease_sin_out);
   
   vngen_scene_destroy("bg", trans_fade, 2);
   
   vngen_label_destroy("label", trans_slide_left, 0.5, ease_sin_out);
   
   vngen_textbox_destroy("textbox", trans_slide_up, 0.5, ease_sin_out);
}

if (vngen_event()) {

	vngen_object_clear(true);
	
}

vngen_event_reset_target();