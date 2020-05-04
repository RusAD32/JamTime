/*                                                                                                */
/* This script inserts a room into a dungeon.                                                     */
/* The arguments are the four room valuables and the four walk variables.                         */
/*                                                                                                */

var first_partU = argument0[0];
var first_partR = argument0[1];
var first_part  = argument0[2];
var first_partL = argument0[3];
var my_walk = argument1;


var all_ok = false;
var top, left, right, bottom;


if dungeon_width >= dungeon_min and dungeon_height >= dungeon_min
{
    all_ok = false;
    
    for(i = 3; i >= 0 and not all_ok; i--) {    
    //for(i = 0; i < 4 and not all_ok; i++) {
        sq = my_walk[i];
        // Set square location
        if (sq == 0) {
            top = 0;
            left = 0;
            right = floor(dungeon_width/2) - 1;
            bottom = floor(dungeon_height/2) - 1;
        }
        if (sq == 1) {        
            top = 0 ;
            left = floor(dungeon_width/2);
            right = dungeon_width - 1;
            bottom = floor(dungeon_height/2) - 1;
        }
        if (sq == 2) {
            top = floor(dungeon_height/2);
            left = 0;
            right = floor(dungeon_width/2) - 1;
            bottom = dungeon_height - 1;
        }
        if (sq == 3) {
            top  = floor(dungeon_height/2);
            left = floor(dungeon_width/2);
            right = dungeon_width - 1;
            bottom = dungeon_height - 1;
        }

        for(yy=bottom; yy >= top and not all_ok; yy--)
        {
            for(xx = right; xx >= left; xx--)
            {
                if dungeon[xx, yy] == c_t.U  
                {
                    dungeon[xx, yy] = first_partU;   
                    all_ok = true;
                    break;
                }
                else if dungeon[xx, yy] == c_t.R
                {
                    dungeon[xx, yy] = first_partR;
                    all_ok = true;
                    break;       
                }
                else if dungeon[xx, yy] == c_t.D
                {
                    dungeon[xx, yy] = first_part;
                    all_ok = true;
                    break;               
                }
                else if dungeon[xx, yy] == c_t.L
                {
                    dungeon[xx, yy] = first_partL;   
                    all_ok = true;
                    break;        
                }        
            }  //for(yy=top; yy <= bottom; yy++)
        }  // for(xx = left; xx <= right and not all_ok; xx++)
    }  // for(i = 0; i < 4 and not all_ok; i++)
}  // if dungeon_width >= dungeon_min

return(all_ok);
