/*                                                                                                */
/* This loop is about to add air to the dungeon                                                   */
/*                                                                                                */
for(xx = 1; xx < dungeon_width - 1; xx++) {
    for(yy = 1; yy < dungeon_height - 1; yy++) {    
        var tmp = dungeon[xx, yy];
        
        if( tmp == c_t.RDL ||
            tmp == c_t.UDL ||
            tmp == c_t.URL ||
            tmp == c_t.URD )
        {
            dungeon[xx, yy] = c_t.URDL;
        }
        else if(tmp == c_t.UR ||
                tmp == c_t.DL ||
                tmp == c_t.UL ||
                tmp == c_t.RD ||
                tmp == c_t.UD ||
                tmp == c_t.RL)
        {
            dungeon[xx, yy] = c_t.URDL;
        }
        else if(tmp == c_t.X)
        {
            dungeon[xx, yy] = c_t.URDL;
        }

    }
}

cleanup_dungeon();

