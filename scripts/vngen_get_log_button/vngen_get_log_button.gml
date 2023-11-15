/// @function	vngen_get_log_button([clear]);
/// @param		{boolean}	[clear]
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved
function vngen_get_log_button() {

	/*
	Returns the ID of the most recently-selected log button. If no such selection exists,
	-1 will be returned instead. Can also clear log button results after returning to
	prevent code from being executed multiple times. Clearing is enabled by default.

	By using this script in "if" or "switch" statements after a log button has been created,
	virtually any action can be triggered by an on-screen menu.

	argument0 = enables or disables clearing button results to prevent re-execution (boolean) (true/false) (optional, use no argument for true)

	Example usage:
	   if (vngen_get_log_button() == "btn_close") {
	      vngen_do_log_display();
	   }
	*/

	//Get the most recent button
	var button_last = button_result;

	//Get clear mode
	var button_clear = true;
	if (argument_count > 0) {
	   if (argument[0] == false) {
	      button_clear = false;
	   }
	}

	//Clear button results, if enabled
	if (button_clear == true) {
	   button_result = -1;
	}

	//Return button results
	return button_last;


}
