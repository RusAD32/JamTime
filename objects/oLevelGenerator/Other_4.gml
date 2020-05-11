/// @description Insert description here
// You can write your code in this editor
randomize();
room_width = irandom_range(60, 600) * 32;
room_height = irandom_range(60, 600) * 32;
/// Create the Level
cellsize = 32;
roomsizeaverage = choose(14,16,18,20);
rooms = irandom_range(5, 50);
hallwaysize = choose(3,4,5);
padding = choose(4,8,10);



// CREATE DUNGEON
scr_create_dungeon3(cellsize, rooms, roomsizeaverage, hallwaysize, padding);

var dist_between_enemies = 2000 / level_number;
var dist_between_traps = 1000 / level_number;
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
				}else if irandom(200) == 1 {
					instance_create_depth(xx*cellsize + cellsize/2, yy*cellsize + cellsize/2, -10, oEnemyShooter)
				} else if irandom(300) == 1 {
					instance_create_depth(xx*cellsize + cellsize/2, yy*cellsize + cellsize/2, -10, oEnemyShy)
				} 
			}
			
			if irandom(100) == 1 && not collision_circle(xx*cellsize, yy*cellsize, 100 ,oPlayer,false,false){
				instance_create_depth(xx*cellsize, yy*cellsize, -10, oSpikeFloor);
			} else if irandom(200) == 1 && not collision_circle(xx*cellsize, yy*cellsize, 100 ,oPlayer,false,false){
				instance_create_depth(xx*cellsize, yy*cellsize, -10, oBonusTime);
			} else if irandom(500) == 1 {
				instance_create_depth(xx*cellsize, yy*cellsize, -10, oPowerupChest);
			}
		} else if ds_grid_get(grid, xx, yy) == WALL {
			var angle = 0;
			if ds_grid_get(grid, xx, yy-1) == FLOOR {
				angle = 90;	
			} else if ds_grid_get(grid, xx-1, yy) == FLOOR {
				angle = 180;
			} else if ds_grid_get(grid, xx, yy+1) == FLOOR {
				angle = 270;	
			}
			if irandom(100) = 1 {
				var fwall = instance_create_depth(xx*cellsize + cellsize/2, yy*cellsize + cellsize/2, -10, oWallFlame);
				fwall.image_angle = angle;
			} else if irandom(100) = 1 {
				var fwall = instance_create_depth(xx*cellsize + cellsize/2, yy*cellsize + cellsize/2, -10, oWallArrows);
				fwall.image_angle = angle;
			}
		}
	}
}

//scr_create_dungeon2(cellsize, reps, dirfrequency, roomsizeaverage, roomfrequency);
oCamera.x = oPlayer.x
oCamera.y = oPlayer.y