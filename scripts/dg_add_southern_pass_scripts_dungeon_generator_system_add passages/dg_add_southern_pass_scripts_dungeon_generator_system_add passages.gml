/*                                                                                                */
/* Adds a passage on the bottom side of the dungeon.                                              */
/*                                                                                                */

var _start = irandom(dungeon_width)

for(var tmp = 0; tmp < dungeon_width; tmp++)
{
    var xx = (_start + tmp) % dungeon_width;

    // URL UR UL RL U R L
    var yy = dungeon_height - 1;
    if dungeon[xx, yy] == c_t.URL
    {
        dungeon[xx, yy] = c_t.URDL
        break
    }
    
    if dungeon[xx, yy] == c_t.UR 
    {
        dungeon[xx, yy] = c_t.URD
        break
    }

    if dungeon[xx, yy] == c_t.UL 
    {
        dungeon[xx, yy] = c_t.UDL
        break
    }            
    
    if dungeon[xx, yy] == c_t.RL 
    {
        dungeon[xx, yy] = c_t.RDL
        break
    }

    if dungeon[xx, yy] == c_t.U
    {
        dungeon[xx, yy] = c_t.UD
        break
    }

    if dungeon[xx, yy] == c_t.R
    {
        dungeon[xx, yy] = c_t.RD
        break
    }            
    
    if dungeon[xx, yy] == c_t.L 
    {
        dungeon[xx, yy] = c_t.DL
        break
    }
        
}
