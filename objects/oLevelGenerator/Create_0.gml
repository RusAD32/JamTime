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
hallwaysize = choose(2,4);
padding = choose(4,8,10);


maptype = 0;

// CREATE DUNGEON
scr_create_dungeon3(cellsize, rooms, roomsizeaverage, hallwaysize, padding);
//scr_create_dungeon2(cellsize, reps, dirfrequency, roomsizeaverage, roomfrequency);
oCamera.x = oPlayer.x
oCamera.y = oPlayer.y