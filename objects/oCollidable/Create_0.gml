/// @description Insert description here
// You can write your code in this editor
var cellsize = 32;
if instance_exists(oLevelGenerator) {
	cellsize = oLevelGenerator.cellsize;
}
tile_add(sWall, 0, 0, cellsize, cellsize, x, y, 0);
var neighbour = collision_point(x-1, y, oCollidable, false, true);
if neighbour and neighbour.sprite_height == sprite_height {
	neighbour.image_xscale++;
	instance_destroy(self);
}

neighbour = collision_point(x, y-1, oCollidable, false, true);
if neighbour and neighbour.sprite_width == sprite_width {
	neighbour.image_yscale++;
	instance_destroy(self);
}
depth = -y;
