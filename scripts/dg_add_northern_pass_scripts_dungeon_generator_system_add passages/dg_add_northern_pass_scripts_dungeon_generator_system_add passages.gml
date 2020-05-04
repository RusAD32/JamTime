/*                                                                                                */
/* Adds a passage on the top side of the dungeon.                                                 */
/*                                                                                                */

var _start = irandom(dungeon_width)

for(var tmp = 0; tmp < dungeon_width; tmp++)
{
    var xx = (_start + tmp) % dungeon_width;

    // URDL RDL RD RL DL R D L
    yy = 0;
    if dungeon[xx, yy] == c_t.RDL
    {
        dungeon[xx, yy] = c_t.URDL
        break;
    }
    
    if dungeon[xx, yy] == c_t.RD 
    {
        dungeon[xx, yy] = c_t.URD
        break
    }
    
    if dungeon[xx, yy] == c_t.RL 
    {
        dungeon[xx, yy] = c_t.URL
        break
    }
    
    if dungeon[xx, yy] == c_t.DL 
    {
        dungeon[xx, yy] = c_t.UDL
        break
    }        
    
    if dungeon[xx, yy] == c_t.R 
    {
        dungeon[xx, yy] = c_t.UR
        break
    }        

    if dungeon[xx, yy] == c_t.D
    {
        dungeon[xx, yy] = c_t.UD
        break
    }        

    if dungeon[xx, yy] == c_t.L
    {
        dungeon[xx, yy] = c_t.UL
        break
    }   
}     
