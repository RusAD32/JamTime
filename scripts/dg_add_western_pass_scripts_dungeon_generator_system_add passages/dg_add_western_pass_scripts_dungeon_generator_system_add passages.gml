/*                                                                                                */
/* Adds a passage on the left side of the dungeon.                                                */
/*                                                                                                */

var _start = irandom(dungeon_height)

for(var tmp = 0; tmp < dungeon_height; tmp++)
{
    var yy = (_start + tmp) % dungeon_height;
    var xx = 0;
         
    if dungeon[xx, yy] == c_t.URD
    {
        dungeon[xx, yy] = c_t.URDL
        break;
        return 0;
    }
    
    if dungeon[xx, yy] == c_t.RD
    {
        dungeon[xx, yy] = c_t.RDL
        break;
    }
    
    if dungeon[xx, yy] == c_t.UR
    {
        dungeon[xx, yy] = c_t.URL
        break;
    }
    
    if dungeon[xx, yy] == c_t.UD
    {
        dungeon[xx, yy] = c_t.UDL
        break;
    }

    if dungeon[xx, yy] == c_t.U
    {
        dungeon[xx, yy] = c_t.UL
        break;
    }        
    
    if dungeon[xx, yy] == c_t.D
    {
        dungeon[xx, yy] = c_t.DL
        break;
    }            
    
    if dungeon[xx, yy] == c_t.R
    {
        dungeon[xx, yy] = c_t.RL
        break;
    }            
}
