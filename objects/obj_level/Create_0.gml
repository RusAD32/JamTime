/*randomize();
/// Create the Level
maptypedisplay = "Organic";
cellsize = 32;
reps = irandom(1000);
carver = irandom(2);
if (carver = 0) carverdisplay = "Plus";
if (carver = 1) carverdisplay = "Diagonal Line";
if (carver = 2) carverdisplay = "Square";
carversize = irandom(10);
dirfrequency = irandom(10);
roomsizeaverage = choose(4,8,10,12,14);
roomfrequency = irandom(100);
rooms = irandom(50);
hallwaysize = choose(2,4);
padding = choose(2,4,8,10);


maptype = choose(0,1,2,3,4);

// CREATE DUNGEON
if (maptype = 0) {
    scr_create_dungeon(cellsize, reps, carver, carversize);
    scr_save_dungeon("Dungeon");
} 
if (maptype = 1) {
    scr_create_dungeon2(cellsize, reps, dirfrequency, roomsizeaverage, roomfrequency);
    scr_save_dungeon("Dungeon");
}
if (maptype = 2) {
    scr_create_dungeon3(cellsize, rooms, roomsizeaverage, hallwaysize, padding);
    scr_save_dungeon("Dungeon");
}
if (maptype = 3) {
    scr_create_dungeon4(cellsize, rooms, 14, 4);
    scr_save_dungeon("Dungeon");
}
// LOAD DUNGEON
if (maptype = 4) {
    scr_load_dungeon("Dungeon", cellsize);
}


*/