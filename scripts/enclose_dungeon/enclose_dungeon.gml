/*                                                                                                */
/* These two loops enclose the dungeon.                                                           */
/* They go along the vertical and horizontal sides of the dungeon and cut off any hallways        */
/* that lead outside by replacing some of the cells.                                              */
/*                                                                                                */
for(yy = 0; yy < dungeon_height; yy++)
{
    xx = 0;
         
    if dungeon[xx, yy] == c_t.URDL
    {
        dungeon[xx, yy] = c_t.URD
    }
    
    if dungeon[xx, yy] == c_t.RDL 
    {
        dungeon[xx, yy] = c_t.RD
    }
    
    if dungeon[xx, yy] == c_t.URL 
    {
        dungeon[xx, yy] = c_t.UR
    }
    
    if dungeon[xx, yy] == c_t.UDL 
    {
        dungeon[xx, yy] = c_t.UD
    }

    xx = dungeon_width - 1;
    if dungeon[xx, yy] == c_t.URDL
    {
        dungeon[xx, yy] = c_t.UDL
    }
    
    if dungeon[xx, yy] == c_t.RDL 
    {
        dungeon[xx, yy] = c_t.DL
    }
    
    if dungeon[xx, yy] == c_t.URL 
    {
        dungeon[xx, yy] = c_t.UL
    }
    if dungeon[xx, yy] == c_t.URD 
    {
        dungeon[xx, yy] = c_t.UD
    }
}

for(xx = 0; xx < dungeon_width; xx++)
{
    yy = 0;
    if dungeon[xx, yy] == c_t.URDL
    {
        dungeon[xx, yy] = c_t.RDL
    }
    
    if dungeon[xx, yy] == c_t.URD 
    {
        dungeon[xx, yy] = c_t.RD
    }
    
    if dungeon[xx, yy] == c_t.URL 
    {
        dungeon[xx, yy] = c_t.RL
    }
    
    if dungeon[xx, yy] == c_t.UDL 
    {
        dungeon[xx, yy] = c_t.DL
    }        

    yy = dungeon_height - 1;
    if dungeon[xx, yy] == c_t.URDL
    {
        dungeon[xx, yy] = c_t.URL
    }
    
    if dungeon[xx, yy] == c_t.URD 
    {
        dungeon[xx, yy] = c_t.UR
    }
    
    if dungeon[xx, yy] == c_t.RDL 
    {
        dungeon[xx, yy] = c_t.RL
    }
    
    if dungeon[xx, yy] == c_t.UDL 
    {
        dungeon[xx, yy] = c_t.UL
    }            
}
