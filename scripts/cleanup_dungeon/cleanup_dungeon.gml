/*                                                                                                */
/* This loop is about to clean up the dungeon and make it neater. Or...?                          */
/*                                                                                                */
for(xx = 0; xx < dungeon_width; xx++) {
    for(yy = 0; yy < dungeon_height; yy++) {
        //           URDl
        var stuff = "    ";
        var tt;
        
        if yy - 1 >= 0  
        {
            tt = dungeon[xx, yy - 1];
            var up = tt == c_t.URDL or tt == c_t.D or tt == c_t.DL or tt == c_t.RD or tt == c_t.RDL or  tt == c_t.URD  or tt == c_t.UDL or tt == c_t.UD
        }
        else var up = false;

        if yy + 1 < dungeon_height  
        { 
            tt = dungeon[xx, yy + 1];
            var down = tt == c_t.URDL or tt == c_t.U or tt == c_t.UL or tt == c_t.UR or tt == c_t.URL or  tt == c_t.URD  or tt == c_t.UDL or tt == c_t.UD
        }
        else var down = false;

        if xx - 1 >= 0  
        {
            tt = dungeon[xx - 1, yy];
            var left = tt == c_t.URDL or tt == c_t.R or tt == c_t.UR or tt == c_t.RD or tt == c_t.URL or  tt == c_t.URD  or tt == c_t.RDL or tt == c_t.RL
        }
        else var left = false;

        if xx + 1 < dungeon_width  
        {
            tt = dungeon[xx + 1, yy];
            var right = tt == c_t.URDL or tt == c_t.L or tt == c_t.UL or tt == c_t.DL or tt == c_t.URL or  tt == c_t.UDL or tt == c_t.RDL or tt == c_t.RL
        }
        else var right = false;

        if dungeon[xx, yy] == c_t.URDL
        {
            if not up    dungeon[xx, yy] = c_t.RDL;
            if not down  dungeon[xx, yy] = c_t.URL;
            if not left  dungeon[xx, yy] = c_t.URD;
            if not right dungeon[xx, yy] = c_t.UDL;
        }

        if dungeon[xx, yy] == c_t.RDL
        {
            if not down  dungeon[xx, yy] = c_t.RL;
            if not left  dungeon[xx, yy] = c_t.RD;
            if not right dungeon[xx, yy] = c_t.DL;
        }
        
        if dungeon[xx, yy] == c_t.URL
        {
            if not up    dungeon[xx, yy] = c_t.RL;
            if not left  dungeon[xx, yy] = c_t.UR;
            if not right dungeon[xx, yy] = c_t.UL;
        }

        if dungeon[xx, yy] == c_t.URD
        {
            if not up    dungeon[xx, yy] = c_t.RD;
            if not down  dungeon[xx, yy] = c_t.UR;
            if not right dungeon[xx, yy] = c_t.UD;
        }

        if dungeon[xx, yy] == c_t.UDL
        {
            if not up    dungeon[xx, yy] = c_t.DL;
            if not down  dungeon[xx, yy] = c_t.UL;
            if not left  dungeon[xx, yy] = c_t.UD;
        }

        /* ############################################################################################## */

        if dungeon[xx, yy] == c_t.UR
        {
            if not right dungeon[xx, yy] = c_t.U;
            if not up    dungeon[xx, yy] = c_t.R;
        }
        
        if dungeon[xx, yy] == c_t.RD
        {
            if not down  dungeon[xx, yy] = c_t.R;
            if not right dungeon[xx, yy] = c_t.D;
        }

        if dungeon[xx, yy] == c_t.DL
        {
            if not left  dungeon[xx, yy] = c_t.D;
            if not down  dungeon[xx, yy] = c_t.L;
        }

        if dungeon[xx, yy] == c_t.UL
        {
            if not up    dungeon[xx, yy] = c_t.L;
            if not left  dungeon[xx, yy] = c_t.U;
        }

        if dungeon[xx, yy] == c_t.UD
        {
            if not up    dungeon[xx, yy] = c_t.D;
            if not down  dungeon[xx, yy] = c_t.U;
        }
        
        if dungeon[xx, yy] == c_t.RL
        {
            if not right dungeon[xx, yy] = c_t.L;
            if not left  dungeon[xx, yy] = c_t.R;
        }
        
        
    }
}    
