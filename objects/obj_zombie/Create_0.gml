//Convert movSpeed from seconds to steps
actSpeed = actSpeed * 60;

//Begin movement alarm
alarm[2] = 1;

//Scale sprite up (temporary)
image_xscale = 2;
image_yscale = 2;

// For damage flash
flashAlpha = 0;
flashColor = c_red;