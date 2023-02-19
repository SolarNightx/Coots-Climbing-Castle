/// @description Code

// Update destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

// Update position
x += (xTo - x) / 25;
y += (yTo - y) / 25;

// Update camera position
camera_set_view_pos(cam, x - view_w/2, y - view_h/2)