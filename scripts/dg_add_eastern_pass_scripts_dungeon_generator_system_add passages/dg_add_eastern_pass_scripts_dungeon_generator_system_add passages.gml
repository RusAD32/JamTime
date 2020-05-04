/*                                                                                                */
/* Adds a passage on the right side of the dungeon.                                               */
/*                                                                                                */


// Add eastern pass   
var start = irandom(dungeon_height)

for(var tmp = 0; tmp < dungeon_height; tmp++)
{
    var yy = (start + tmp) % dungeon_height;
    var xx = dungeon_width - 1;
    
    if dungeon[xx, yy] == c_t.UDL
    {
        dungeon[xx, yy] = c_t.URDL
        break;
    }
    
    if dungeon[xx, yy] == c_t.DL 
    {
        dungeon[xx, yy] = c_t.RDL
        break;
    }
    
    if dungeon[xx, yy] == c_t.UL 
    {
        dungeon[xx, yy] = c_t.URL
        break;
    }
    if dungeon[xx, yy] == c_t.UD 
    {
        dungeon[xx, yy] = c_t.URD
        break;
    }
    
    if dungeon[xx, yy] == c_t.U
    {
        dungeon[xx, yy] = c_t.UR
        break;
    }        
    
    if dungeon[xx, yy] == c_t.D
    {
        dungeon[xx, yy] = c_t.RD
        break;
    }            
    
    if dungeon[xx, yy] == c_t.L
    {
        dungeon[xx, yy] = c_t.RL
        break;
    }          
        
}
