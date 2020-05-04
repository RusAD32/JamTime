/// @description  scr_create_dungeon3(Cell Size, Rooms, Room Size, Hallway Size, Padding)
/// @param Cell Size
/// @param  Rooms
/// @param  Room Size
/// @param  Hallway Size
/// @param  Padding




// Arguments
var cellsize    = argument0;
var rooms       = argument1;
var roomsize    = argument2;
var hallwaysize = argument3;
var padding     = argument4;


// Set up some constants
var FLOOR       = -5;
var WALL        = -6;
var VOID        = -7;




// Set Grid width and height
var width = (room_width div cellsize);
var height = (room_height div cellsize);

// Create the Grid
grid = ds_grid_create(width,height);

// Fill Grid
ds_grid_set_region(grid,0,0,width - 1, height - 1, VOID);

// Randomize the Word
randomize();

// Create the controller in center of grid
var cx = (width div 2);
var cy = (height div 2);

// Create the player
instance_create(cx * cellsize + 16, cy * cellsize + 16, oPlayer);

// Give controller random direction
var cdir = irandom(3);

// Odds variable for changing directon
var odds = 1;

// Create the inital Room
for (var xx = -(roomsize / 2); xx < (roomsize / 2); xx++) {
    for (var yy = -(roomsize / 2); yy < (roomsize / 2); yy++) {
        ds_grid_set(grid, cx + xx, cy + yy, FLOOR);
    }
}
// Keep track of how many times we passed through the repeat statement
// used to avoid fense-post problems
passthrough = 0;
makehallway = 1;

// MAKE THE DUNGEON
repeat(rooms) {
    // Check to see if were 1 pass away from finished and if so, dont make a hallway
    if (passthrough == (rooms - 1)) makehallway = 0;
    
    // Randomize the directon
    if (irandom(odds) == odds) {
        cdir = irandom(3);
    }

    // Make the hallway
    if (makehallway == 1) {
        // Left Hallway
        if (cdir = 0) {
            for (var xx = 0; xx < (roomsize + padding); xx++) {                     // Length of the hallway is equal to the roomsize plus the padding
                for (var yy = -(hallwaysize / 2); yy < (hallwaysize / 2); yy++) {   // The width
                    ds_grid_set(grid, cx + xx, cy + yy, FLOOR);
                }
            }
        }
        // Down Hallway
        if (cdir = 1) {
            for (var xx = -(hallwaysize / 2); xx < (hallwaysize / 2); xx++) {
                for (var yy = 0; yy < (roomsize + padding); yy++) {
                    ds_grid_set(grid, cx + xx, cy - yy, FLOOR);
                }
            }
        }
        // Right Hallway
        if (cdir = 2) {
            for (var xx = 0; xx < (roomsize + padding); xx++) {
                for (var yy = -(hallwaysize / 2); yy < (hallwaysize / 2); yy++) {
                    ds_grid_set(grid, cx - xx, cy + yy, FLOOR);
                }
            }
        }
        // Up Hallway
        if (cdir = 3) {
            for (var xx = -(hallwaysize / 2); xx < (hallwaysize / 2); xx++) {
                for (var yy = 0; yy < (roomsize + padding); yy++) {
                    ds_grid_set(grid, cx + xx, cy + yy, FLOOR);
                }
            }
        }
    }

    // Make a new room
	var cur_room_size_x = roomsize - irandom(roomsize/2);
	var cur_room_size_y = roomsize - irandom(roomsize/2);
    for (var xx = -(cur_room_size_x / 2); xx < (cur_room_size_x / 2); xx++) {
        for (var yy = -(cur_room_size_y / 2); yy < (cur_room_size_y / 2); yy++) {
            ds_grid_set(grid, cx + xx, cy + yy, FLOOR);
        }
    }
    
    
    // Move controller
    if (cdir = 0) cx += (cur_room_size_x + padding);
    if (cdir = 1) cy -= (cur_room_size_y + padding);
    if (cdir = 2) cx -= (cur_room_size_x + padding);
    if (cdir = 3) cy += (cur_room_size_y + padding);
    
    // Make sure the controller doesnt move outside grid
    cx = clamp(cx, (roomsize + padding), width - (roomsize + padding));
    cy = clamp(cy, (roomsize + padding), height - (roomsize + padding));
    
    // Add 1 to passthrough because we have completed this room
    passthrough++;
}


// Check to see if there is a floor tile aginst the edge of the grid and change it to a wall
for (var yy = 0; yy < height; yy++) {
    for (var xx = 0; xx < width; xx++) {
        if (ds_grid_get(grid, xx, yy) == FLOOR) {
            if (xx < 1)      ds_grid_set(grid, xx, yy, WALL);       // Check the left wall
            if (xx > width - 2)  ds_grid_set(grid, xx, yy, WALL);    // Check the right wall
            if (yy < 1)      ds_grid_set(grid, xx, yy, WALL);       // Check the top wall
            if (yy > height - 2) ds_grid_set(grid, xx, yy, WALL);   // Check the bottom wall
        }
    }
}


// Loop Through the grid and place the walls
for (var yy = 1; yy < height - 1; yy++) {
    for (var xx = 1; xx < width - 1; xx++) {
        if (ds_grid_get(grid, xx, yy) == FLOOR) {
            if (ds_grid_get(grid, xx + 1, yy) != FLOOR) ds_grid_set(grid, xx + 1, yy, WALL);    // Right wall
            if (ds_grid_get(grid, xx - 1, yy) != FLOOR) ds_grid_set(grid, xx - 1, yy, WALL);    // Left Wall
            if (ds_grid_get(grid, xx, yy + 1) != FLOOR) ds_grid_set(grid, xx, yy + 1, WALL);    // Up wall
            if (ds_grid_get(grid, xx, yy - 1) != FLOOR) ds_grid_set(grid, xx, yy - 1, WALL);    // Down Wall
        }
    }
}


// Draw the level
for (var yy = 0; yy < height; yy++) {
    for (var xx = 0; xx < width; xx++) {
        // IF YOU HAVE YOUR OWN TILES, THIS IS WHERE YOU WOULD ADD IT
        if (ds_grid_get(grid, xx, yy) == FLOOR) {
            // Draw Floor
			var is_near_wall = ds_grid_get(grid, xx-1, yy) == WALL
			is_near_wall |= ds_grid_get(grid, xx+1, yy) == WALL
			is_near_wall |= ds_grid_get(grid, xx, yy-1) == WALL
			is_near_wall |= ds_grid_get(grid, xx, yy+1) == WALL
			if is_near_wall && irandom(50) == 1 {
				if not collision_circle(xx*cellsize, yy*cellsize, 300, obj_light,false,true) {
					instance_create_depth(xx*cellsize, yy*cellsize, -1,  oPointLight);
				}
			}
            tile_add(bg_floor, 0, 0, cellsize, cellsize, xx * cellsize, yy * cellsize, 10)
        }
        if (ds_grid_get(grid, xx, yy) == WALL) {
            // Draw Wall
			instance_create_depth(xx*cellsize, yy*cellsize, 0, oCollidable)
            tile_add(bg_wall, 0, 0, cellsize, cellsize, xx * cellsize, yy * cellsize, 10);
        }
    }
}