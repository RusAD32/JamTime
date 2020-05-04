/*

WARNING: As of now, bg placement is INFLEXIBLE and only works for tile size 32 and dungeon cell 
size 12.

Thus each bg_tile is supposed to be 128 x 128 in size.
You can use up to 9 bg tiles in your 


*/

/*                                                                                                */
/* Size of a cell in pixels.                                                                      */
/*                                                                                                */

// bg_cell_size = 3;
// bg_tile_size = 4 * tile_size;

show_debug_message(bg_chars);
bg_keys[0] = string_char_at(bg_chars[0], 1) + string_char_at(bg_chars[0], 2);
bg_keys[1] = string_char_at(bg_chars[0], 3) + string_char_at(bg_chars[0], 4);
bg_keys[2] = string_char_at(bg_chars[1], 1) + string_char_at(bg_chars[1], 2);
bg_keys[3] = string_char_at(bg_chars[1], 3) + string_char_at(bg_chars[1], 4);
show_debug_message(bg_keys);

/*
for(var i=0; i<2; i++) {
    for(var j=0; j<2; j++) {
        var bg_key = string_char_at(bg_chars[i], j*2) + string_char_at(bg_chars[i], j*2 + 1);
        bg_keys[i*2 + j] = bg_key;
    }
}
*/

var cell_height_px = bg_cell_size * bg_tile_size;
var cell_width_px  = bg_cell_size * bg_tile_size;

var cells;

for(xx = 0; xx < dungeon_width; xx++)
{
    for(yy = 0; yy < dungeon_height; yy++)
    {   
        /* Take the character from the dungeon array                                              */
        ch = dungeon[xx, yy];
        
        /* And choose the array of cells that fits for this type                                  */
        if(dungeon[xx, yy] == c_t.X)
        {
            cells = bg_x;
        }
        else if(dungeon[xx, yy] == c_t.URD or dungeon[xx, yy] == c_t.UDL or dungeon[xx, yy] == c_t.URL or dungeon[xx, yy] == c_t.RDL)
        {
            cells = bg_rdl;
        }
        else if(dungeon[xx, yy] == c_t.UD or dungeon[xx, yy] == c_t.RL)
        {
            cells = bg_ud;
        }
        else if(dungeon[xx, yy] == c_t.URDL)
        {
            cells = bg_urdl;
        }
        else if(ch == c_t.UR or ch == c_t.RD or ch == c_t.UL or ch == c_t.DL)
        {
            cells = bg_rd;
        }
        else if(ch == c_t.U or ch == c_t.R or ch == c_t.D or ch == c_t.L 
            or ch == c_t.start or ch == c_t.startU or ch == c_t.startR or ch == c_t.startL
            or ch == c_t.finish or ch == c_t.finishU or ch == c_t.finishR or ch == c_t.finishL
            or ch == c_t.lock or ch == c_t.lockU or ch == c_t.lockR or ch == c_t.lockL
            or ch == c_t.key or ch == c_t.keyU or ch == c_t.keyR or ch == c_t.keyL
            or ch == c_t.locked_finish or ch == c_t.locked_finishU 
                or ch == c_t.locked_finishR or ch == c_t.locked_finishL
            )
        {
            cells = bg_d;
        }                
           
        else continue;
        
        var cell = cells;

        /* Check if rotation if necessary and determine x_rot and y_rot                   */
        rotation = 0;
        
        tmp = dungeon[xx, yy];
        // 90 turn placement
        if(dungeon[xx, yy] == c_t.UDL or tmp == c_t.DL or tmp == c_t.L or tmp == c_t.startL or tmp == c_t.finishL or tmp == c_t.keyL or tmp == c_t.lockL) {
            rotation = 90;
        }                
        // 180 turn placement
        else if(dungeon[xx, yy] == c_t.URL or tmp == c_t.UL or tmp == c_t.U or tmp == c_t.startU or tmp == c_t.finishU or tmp == c_t.keyU or tmp == c_t.lockU) {
            rotation = 180;
        }
        // 270 turn placement
        else if(dungeon[xx, yy] == c_t.URD or dungeon[xx, yy] == c_t.RL or tmp == c_t.UR or tmp == c_t.R or tmp == c_t.startR or tmp == c_t.finishR or tmp == c_t.keyR or tmp == c_t.lockR) {
            rotation = 270;
        }              
        
        /* And then for every place in this cell                                                  */
        for(w = 0; w < bg_cell_size; w++)
        {
            for(h = 0; h < bg_cell_size; h++)
            {   
                /* Check if rotation if necessary and determine x_rot and y_rot                   */
                if(rotation == 0)
                {
                    x_rot = w;
                    y_rot = h;
                }
                // 90 turn placement
                else if(rotation == 90) {
                    x_rot = h;
                    y_rot = bg_cell_size - w - 1;
                }                
                // 180 turn placement
                else if(rotation == 180) {
                    x_rot = bg_cell_size - w - 1;
                    y_rot = bg_cell_size - h - 1;
                }
                // 270 turn placement
                else if(rotation == 270) {
                    x_rot = bg_cell_size - h - 1;
                    y_rot = w;
                }                
                
                // /* Get the character from the cell at x_rot and y_rot                             */
                // ch = string_char_at(cell[y_rot], x_rot + 1);
                
                /* Get two characters from the cell at x_rot and y_rot                            */
                ch1 = string_char_at(cell[y_rot], x_rot * 2 + 1);
                ch2 = string_char_at(cell[y_rot], x_rot * 2 + 2);
                ch = ch1 + ch2;
                                
                /* And only if this character exist in the legend, put an object into the room    */
                map_x = xx*cell_width_px + x; // + bg_tile_size; //  /2;
                map_y = yy*cell_height_px + y; // + bg_tile_size;
                // obj_id = instance_create(map_x + w*tile_size, map_y + h*tile_size, legend[? ch]);
                
                var left, top, width = 128, height = 128;
                //show_debug_message(bg_keys[0] + '==' + ch);
                if ch == bg_keys[0]
                {
                    left = 0;
                    top = 0;
                    tile_add(dg_background, left, top, width, height, map_x + w*bg_tile_size, map_y + h*bg_tile_size, 0);
                }
                else if ch == bg_keys[1]
                {
                    left = 128;
                    top = 0;                   
                    tile_add(dg_background, left, top, width, height, map_x + w*bg_tile_size, map_y + h*bg_tile_size, 0);
                }
                else if ch == bg_keys[2]
                {
                    left = 0;
                    top = 128;                   
                    tile_add(dg_background, left, top, width, height, map_x + w*bg_tile_size, map_y + h*bg_tile_size, 0);
                }
                else if ch == bg_keys[3]
                {
                    left = 128;
                    top = 128;
                    tile_add(dg_background, left, top, width, height, map_x + w*bg_tile_size, map_y + h*bg_tile_size, 0);
                }

                
                
            } // end of for(h = 0; h < bg_cell_size; h++)
        }  // end of for(w = 0; w < bg_cell_size; w++)
        
    } // end of for(yy = 0; yy < dungeon_height; yy++)
} // end of for(xx = 0; xx < dungeon_width; xx++)
    
//cleanup
