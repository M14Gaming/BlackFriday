if(instance_exists(script_base) or instance_exists(obj_roomTransition)) then exit;

//If character is on grid and not moving, player can control
if (target_x == x and target_y == y)
{
    can_control = true;
    image_speed = 0;
}

///character direction and movement
if (target_x > x)
{
    x +=4
}
if (target_x < x)
{
    x -=4
}

if (target_y > y)
{
    y +=4
}
if (target_y < y)
{
    y -=4
}

//get wall tileset to check
var wall_lay_id = layer_get_id("Wall");
var wall_map_id = layer_tilemap_get_id(wall_lay_id);

//If the character can be controlled and there's nothing blocking movement, move
if (keyboard_check(vk_up) and can_control and tilemap_get_at_pixel(wall_map_id, x, y-64) == 0)
{
	target_y -= 64;
	image_speed = 3;
	can_control = false;
}

if (keyboard_check(vk_down) and can_control and tilemap_get_at_pixel(wall_map_id, x, y+64) == 0)
{
	target_y += 64;
	image_speed = 3;
	can_control = false;
}

if (keyboard_check(vk_left) and can_control and tilemap_get_at_pixel(wall_map_id, x-64, y) == 0)
{
	target_x -= 64;
	image_speed = 3;
	can_control = false;
}

if (keyboard_check(vk_right) and can_control and tilemap_get_at_pixel(wall_map_id, x+64, y) == 0)
{
	target_x += 64;
	image_speed = 3;
	can_control = false;
}