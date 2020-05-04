/*                                                                                                */
/* Now the structure of a dungeon is fully generated. It is time to select appropriate cells      */
/* and spawn objects accordingly.                                                                 */
/*                                                                                                */

// put dungeon ================================================================================== //

/*                                                                                                */
/* Size of a cell in pixels.                                                                      */
/*                                                                                                */
cell_height_px = cell_size * tile_size;
cell_width_px = cell_size * tile_size;

var dead_end = 0;
/*                                                                                                */
/* For each element of the dungeon array...                                                       */
/*                                                                                                */
for(xx = 0; xx < dungeon_width; xx++)
{
    for(yy = 0; yy < dungeon_height; yy++)
    {   
        /* Take the character from the dungeon array                                              */
        ch = dungeon[xx, yy];
        
        /* And choose the array of cells that fits for this type                                  */
        if(dungeon[xx, yy] == c_t.X)
        {
            cells = cell_X;
        }
        else if(dungeon[xx, yy] == c_t.URD or dungeon[xx, yy] == c_t.UDL or dungeon[xx, yy] == c_t.URL or dungeon[xx, yy] == c_t.RDL)
        {
            cells = cell_RDL;
        }
        else if(dungeon[xx, yy] == c_t.UD or dungeon[xx, yy] == c_t.RL)
        {
            cells = cell_UD;
        }
        else if(dungeon[xx, yy] == c_t.URDL)
        {
            cells = cell_URDL;
        }
        else if(ch == c_t.UR or ch == c_t.RD or ch == c_t.UL or ch == c_t.DL)
        {
            cells = cell_RD;
        }
        else if(ch == c_t.U or ch == c_t.R or ch == c_t.D or ch == c_t.L)
        {
            cells = cell_D;
            dead_end = (dead_end + 1) % array_height_2d(cell_D);
        }
        else if(ch == c_t.start or ch == c_t.startU or ch == c_t.startR or ch == c_t.startL)
        {
            cells = cell_start;
        }        
        else if(ch == c_t.finish or ch == c_t.finishU or ch == c_t.finishR or ch == c_t.finishL)
        {
            cells = cell_finish;
        }             
        else if(ch == c_t.lock or ch == c_t.lockU or ch == c_t.lockR or ch == c_t.lockL)
        {
            cells = cell_lock;
        }        
        else if(ch == c_t.key or ch == c_t.keyU or ch == c_t.keyR or ch == c_t.keyL)
        {
            cells = cell_key;
        }                
           
        else continue;
        
        /* Select a random cell from the array of cells we picked.                                */
        cellno = irandom(array_height_2d(cells) - 1);
        
        /* dead end rooms should not repeat often */
        if(ch == c_t.U or ch == c_t.R or ch == c_t.D or ch == c_t.L)
        {
            cellno = dead_end;                    
        }

        /* And copy it into a new array called 'cell'                                             */
        len = array_length_2d(cells, 0);
        for(i = 0; i < len; i++)
        {
            cell[i] = cells[cellno, i];
        }

        /* And then for every place in this cell                                                  */
        for(w = 0; w < cell_size; w++)
        {
            for(h = 0; h < cell_size; h++)
            {   
                /* Check if rotation if necessary and determine x_rot and y_rot                   */
                x_rot = w;
                y_rot = h;
                rotation = 0;
                
                tmp = dungeon[xx, yy];
                // 90 turn placement
                if(dungeon[xx, yy] == c_t.UDL or tmp == c_t.DL or tmp == c_t.L or tmp == c_t.startL or tmp == c_t.finishL or tmp == c_t.keyL or tmp == c_t.lockL) {
                    x_rot = h;
                    y_rot = cell_size - w - 1;
                    rotation = 90;
                }                
                // 180 turn placement
                else if(dungeon[xx, yy] == c_t.URL or tmp == c_t.UL or tmp == c_t.U or tmp == c_t.startU or tmp == c_t.finishU or tmp == c_t.keyU or tmp == c_t.lockU) {
                    x_rot = cell_size - w - 1;
                    y_rot = cell_size - h - 1;
                    rotation = 180;
                }
                // 270 turn placement
                else if(dungeon[xx, yy] == c_t.URD or dungeon[xx, yy] == c_t.RL or tmp == c_t.UR or tmp == c_t.R or tmp == c_t.startR or tmp == c_t.finishR or tmp == c_t.keyR or tmp == c_t.lockR) {
                    x_rot = cell_size - h - 1;
                    y_rot = w;
                    rotation = 270;
                }                
                
                // /* Get the character from the cell at x_rot and y_rot                             */
                // ch = string_char_at(cell[y_rot], x_rot + 1);
                
                /* Get a character from the cell at x_rot and y_rot                            */
                ch1 = string_char_at(cell[y_rot], x_rot + 1);
                //ch2 = string_char_at(cell[y_rot], x_rot * 2 + 2);
                ch = ch1; // + ch2;
                // show_debug_message(ch);                
                
                                
                /* And only if this character exist in the legend, put an object into the room    */
                if(ds_map_exists(legend, ch))
                {
                    map_x = xx*cell_width_px + x;
                    map_y = yy*cell_height_px + y;
                    obj_id = instance_create(map_x + w*tile_size, map_y + h*tile_size, legend[? ch]);
                    
                    var xoff  = sprite_get_xoffset(obj_id.sprite_index);
                    var yoff  = sprite_get_yoffset(obj_id.sprite_index);
                    var bleft = sprite_get_bbox_left(obj_id.sprite_index);
                    var btop  = sprite_get_bbox_top(obj_id.sprite_index);
                    
                    /* Here we add the x and y offset to make the origin point of the sprite irrelevant   */
                    /* And then we detract bounding box left and bounding box top to make top left corner */
                    /* of the collision box align with the grid.                                          */
                    obj_id.x += xoff;
                    obj_id.y += yoff;
                    if ( sprite_get_height(obj_id.sprite_index) > tile_size ) {
                        // This is for the double height sprites, a.k.a WALLS                        
                        obj_id.x -= bleft;
                        obj_id.y -= btop;                    
                    }
                     
                    /* Set the rotation variable so the object knows if it was rotated or not.    */
                    /* Note, that the rotation variable will only be available after the create   */
                    /* event is done. So it will not be available in the create event.            */
                    /* Check obj_dungeon_cat_monster for a possible workaround.                   */
                    obj_id.rotation = rotation;
                }
            } // end of for(h = 0; h < cell_size; h++)
        }  // end of for(w = 0; w < cell_size; w++)
        
    } // end of for(yy = 0; yy < dungeon_height; yy++)
} // end of for(xx = 0; xx < dungeon_width; xx++)
    
