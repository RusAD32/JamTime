/// @description Insert description here
// You can write your code in this editor
randomize();
room_width = irandom_range(60, 600) * 32;
room_height = irandom_range(60, 600) * 32;
/// Create the Level
cellsize = 32;
reps = irandom(1000);
carversize = irandom(10);
dirfrequency = irandom(10);
roomsizeaverage = choose(16,18,20,22,24,26);
roomfrequency = irandom_range(10,100);
rooms = irandom_range(5, 50);
hallwaysize = choose(3,4,5);
padding = choose(4,8,10);


maptype = 0;

// CREATE DUNGEON
scr_create_dungeon3(cellsize, rooms, roomsizeaverage, hallwaysize, padding);

var dist_between_enemies = 1000 / level_number 
// spawn objects in this dungeon
var width = (room_width div cellsize);
var height = (room_height div cellsize);
for (var yy = 0; yy < height; yy++) {
    for (var xx = 0; xx < width; xx++) {
		if (ds_grid_get(grid, xx, yy) == FLOOR) { 
			if not collision_circle(xx*cellsize, yy*cellsize, dist_between_enemies,oEnemyPatrol,false,false) &&
				  not collision_circle(xx*cellsize, yy*cellsize, 500,oPlayer,false,false) {
				if irandom(100) == 1 {
					instance_create_depth(xx*cellsize + cellsize/2, yy*cellsize + cellsize/2, -10, oEnemyPatrol)
				} else if irandom(200) == 1 {
					instance_create_depth(xx*cellsize + cellsize/2, yy*cellsize + cellsize/2, -10, oEnemyAggro)
				} else if irandom(300) == 1 {
					instance_create_depth(xx*cellsize + cellsize/2, yy*cellsize + cellsize/2, -10, oEnemyShy)
				}
			}
		}
	}
}

//scr_create_dungeon2(cellsize, reps, dirfrequency, roomsizeaverage, roomfrequency);
oCamera.x = oPlayer.x
oCamera.y = oPlayer.y