/**************************************************************************************************/
/* This is the generator script.                                                                  */
/* It creates a basic dungeon.                                                                    */
/*                                                                                                */

randomize();

/*                                                                                                */
/* The dungeon generation is somewhat simplified if one of the sides of the dungeon is less than  */
/* the dungeon_min variable. See usage of dungeon_min later for more details.                     */
/*                                                                                                */
dungeon_min = 5;


/*                                                                                                */
/* The dungeon should be at least 3 by 3 for the generator to work right.                         */
/*                                                                                                */

if dungeon_width < 3
{
    dungeon_width = 3;
}

if dungeon_height < 3
{
    dungeon_height = 3;
}


/*                                                                                                */
/* These are metastructures. If the dungeon is big enough, it is split into four parts and each   */
/* part is generated separately.                                                                  */
/*                                                                                                */
i = 0;

/* Goes 0, 2, 3, 1...                                                                             */

meta[i++] = ")(" +
            "\/";

meta[i++] = ")(" +  
            "``";

meta[i++] = ")/" + 
            "\)";

meta[i++] = ")_" + 
            "\)";

meta[i++] = "\(" + 
            "(/";

//meta[i++] = "\/" + 
//            "()";

//meta[i++] = "\_" + 
//            "()";

meta[i++] = "_(" + 
            "(/";

//meta[i++] = "_/" + 
//            "()";

//meta[i++] = "__" + 
//            "()";
// 10

/* Goes 2, 0, 1, 3...                                                                             */
meta[i++] = "/\\" +
            ")(";

meta[i++] = "__" +
            ")(";

meta[i++] = "/)" + 
            ")\\";

meta[i++] = "/)" +
            ")`";

meta[i++] = "(\\" + 
            "/(";

//meta[i++] = "()" + 
//            "/\";

//meta[i++] = "()" +
//            "/`";

meta[i++] = "(\\" +  
            "`(";

//meta[i++] = "()" + 
//            "`\";

//meta[i++] = "()" + 
//            "``"
// 20 

/* Goes 1, 0, 2, 3...                                                                             */
meta[i++] = "(`" +
            "(_";

meta[i++] = "/`" + 
            "\_"   

meta[i++] = "/`" + 
            "`)";  

meta[i++] = "/`" + 
            "`\\";  

meta[i++] = "_)" + 
            "\_";  

//meta[i++] = "_)" + 
//            "`)";  

//meta[i++] = "_)" + 
//            "`\";  

meta[i++] = "_/" + 
            "\_";  

//meta[i++] = "_/" + 
//            "`)";  

//meta[i++] = "_/" + 
//            "`\";  
// 30

/* Goes 0, 1, 3, 2...                                                                             */
meta[i++] = "`)" + 
            "_)";  

meta[i++] = "`\\" + 
            "_/";  

meta[i++] = "`\\" + 
            "(`";  

meta[i++] = "`\\" + 
            "/`";  

meta[i++] = "(_" + 
            "_/";  

//meta[i++] = "(_" + 
//            "(`";  

//meta[i++] = "(_" + 
//            "/`";  

meta[i++] = "\_" + 
            "_/";  

//meta[i++] = "\_" + 
//            "(`";  

//meta[i++] = "\_" + 
//            "/`";
// 40

/* Defence against layouts that don"t have place to put the start and the finish cell.               */
all_ok = false;
while(all_ok == false) {
    all_ok = true;

    /*                                                                                                */
    /* Fill all of the dungeon with impassable cells.                                                 */
    /*                                                                                                */
    for(i = 0; i < dungeon_width; i++) {
        for(j = 0; j < dungeon_height; j++) {
            dungeon[i, j] = c_t.X;
        }
    }
    
    /*                                                                                                */
    /* Choose a random metastructure to use.                                                          */
    /*                                                                                                */
    meta_number = irandom(array_length_1d(meta) - 1)
    metastructure = meta[meta_number]
    var quarter = array_length_1d(meta) / 4;
    if meta_number < quarter
    {
        /* We need these to put start and finish far enough                                           */
        walk[0] = 0
        walk[1] = 2
        walk[2] = 3
        walk[3] = 1
    }
    if meta_number >= quarter and meta_number < 2 * quarter
    {
        walk[0] = 2
        walk[1] = 0
        walk[2] = 1
        walk[3] = 3
    }
    if meta_number >= 2 * quarter and meta_number < 3 * quarter
    {
        walk[0] = 1
        walk[1] = 0
        walk[2] = 2
        walk[3] = 3
    }
    if meta_number >= 3 * quarter
    {
        walk[0] = 0
        walk[1] = 1
        walk[2] = 3
        walk[3] = 2
    }
    
    /*                                                                                                */
    /* And now for each of the four squares of the dungeon...                                         */
    /*                                                                                                */
    for(sq = 0; sq < 4; sq++) {
        // Set square location
        if (sq == 0) {
            /*                                                                                        */
            /* If the dungeon is too small, just treat all dungeon like the square 0.                 */
            /* If not, use upper left square as the square 0.                                         */
            /*                                                                                        */
            if (dungeon_width < dungeon_min or dungeon_height < dungeon_min) { 
                top = 0;
                left = 0;
                right = dungeon_width - 1;
                bottom = dungeon_height - 1;
            } 
            else
            {
                top = 0;
                left = 0;
                right = floor(dungeon_width/2) - 1;
                bottom = floor(dungeon_height/2) - 1;
            }
        }
    
        /*                                                                                            */
        /* If the dungeon is too small, skip all squares that are not the first square.               */
        /*                                                                                            */
        if sq > 0 and (dungeon_width < dungeon_min or dungeon_height < dungeon_min) { continue; }
        
        /*                                                                                            */
        /* Square 1 is the upper right square.                                                        */
        /* Square 2 is the lower left square.                                                         */
        /* Square 3 is the lower right square.                                                        */
        /*                                                                                            */
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
    
        /*                                                                                            */
        /* Take the shape of the square from the metastructure.                                       */
        /*                                                                                            */
        structure = string_char_at(metastructure, sq + 1);
    
        /*                                                                                            */
        /* Set the start point and the end point inside the square according to the shape.            */
        /* Also it sets the mode for the square generation.                                           */
        /* "Z" is a horizontal zigzag and "W" is a vertical one.                                      */
        /*                                                                                            */
        if (structure == "\\") {
            mode = "Z";           
            pen_y = top;
            pen_x = left;
            end_x = right;
            end_y = bottom;
        }
        if (structure == "/") {
            mode = "W";           
            pen_y = bottom;
            pen_x = left;
            end_x = right;
            end_y = top;
        }
        if (structure == "`") {
            mode = "W";
            pen_y = top;
            pen_x = left;
            end_x = right;
            end_y = top;
        }
        if (structure == "_") {
            mode = "W";
            pen_y = bottom;
            pen_x = left;
            end_x = right;
            end_y = bottom;
        }
        if (structure == ")") {
            mode = "Z";
            pen_y = top;
            pen_x = left;
            end_x = left;
            end_y = bottom;
        }
        if (structure == "(") {
            mode = "Z";
            pen_y = top;
            pen_x = right;
            end_x = right;
            end_y = bottom;
        }
        start_x = pen_x;
        start_y = pen_y;
    
        /*                                                                                            */
        /* Place a URDL cell at the start of the hallway.                                             */
        /*                                                                                            */
        dungeon[pen_x, pen_y] = c_t.URDL;
    
        /*                                                                                            */
        /* Now if the mode is Z...                                                                    */
        /*                                                                                            */
        // Z ================================================================;
        if (mode == "Z") {
            /*                                                                                        */
            /* If the starting point is to the right, go left.                                        */
            /* If the starting point is to the left, go right.                                        */
            /*                                                                                        */
            if (pen_x == left) {
                dir = 1;
            }
            if (pen_x == right) {
                dir = -1;
            }
    
            /*                                                                                        */
            /* While we havent reached the bottom line of the current square...                       */
            /*                                                                                        */
            while(pen_y < bottom) {
                /*                                                                                    */
                /* Select a random number of steps to make in the current direction.                  */
                /*                                                                                    */
                steps = irandom(right - left - 1);
                /*                                                                                    */
                /* Move the pen in the current direction for this number of steps.                    */
                /* And place a horizontal hallway in each cell.                                       */
                /*                                                                                    */
                while(steps > 0) {
                    steps -= 1;
                    pen_x += dir;
                    dungeon[pen_x, pen_y] = c_t.RL;
                    /*                                                                                */
                    /* If we have reached left or right side of the square, change direction and      */
                    /* stop making steps.                                                             */
                    /*                                                                                */
                    if (pen_x == right or pen_x == left) {
                        dir = -dir;
                        break;
                    }
                }
    
                /*                                                                                    */
                /* Put a "T" shaped hallway at the current pen location. Go down a level.             */
                /* And put an up right left hallway there.                                            */
                /*                                                                                    */
                dungeon[pen_x, pen_y] = c_t.URDL;
                pen_y += 1;
                dungeon[pen_x, pen_y] = c_t.URL;
            }
    
            /*                                                                                        */
            /* When we have reached the bottom, check where the end point should be and set the       */
            /* direction accordingly.                                                                 */
            /*                                                                                        */
            if (end_x > pen_x) {
                dir = 1;
            }
            else {
                dir = -1;
            }
    
            /* Put horizontal hallways toward the end point.                                          */
            pen_x += dir;
            while(pen_x > left and pen_x < right) {
                dungeon[pen_x, pen_y] = c_t.RL;
                pen_x += dir;
            }
        }
    
        /*                                                                                            */
        /* The "W" mode is really similar to the "Z" mode, but it uses vertical hallways instead.     */
        /*                                                                                            */
        // W ================================================================;
        if (mode == "W") {
            if (pen_y == top) {
                dir = 1;
            }
            if (pen_y == bottom) {
                dir = -1;
            }
    
            while(pen_x < right) {
                steps = irandom(bottom - top - 1);
                while(steps > 0) {
                    steps -= 1;
                    pen_y += dir;
                    dungeon[pen_x, pen_y] = c_t.UD;
                    if (pen_y == top or pen_y == bottom) {
                        dir = -dir;
                        break;
                    }
                }
    
                dungeon[pen_x, pen_y] = c_t.URDL;
                pen_x += 1;
                dungeon[pen_x, pen_y] = c_t.UDL;
            }
    
            if (end_y > pen_y) {
                dir = 1;
            }
            else {
                dir = -1;
            }
    
            pen_y += dir;
            while(pen_y > top and pen_y < bottom) {
                dungeon[pen_x, pen_y] = c_t.UD;
                pen_y += dir;
            }
        }  
        
        /*                                                                                            */
        /* When we"re finished with the square, put "+" shaped hallways at start point and end point. */
        /*                                                                                            */
        dungeon[end_x, end_y] = c_t.URDL;
        dungeon[start_x, start_y] = c_t.URDL;                  
    }
    
    
    /*                                                                                                */
    /* This loop goes though all of the X type cells and replaces them with dead end cells where      */
    /* appropriate.                                                                                   */
    /*                                                                                                */
    for(xx = 1; xx < dungeon_width; xx++) {
        for(yy = 0; yy < dungeon_height; yy++) {
            if( xx > 0 ) {
                tmp = dungeon[xx - 1, yy]
                /* If there"s a hallway to the left of the X type cell...                             */
                if (dungeon[xx, yy] == c_t.X and 
                    (tmp == c_t.RDL    
                    or tmp == c_t.RL 
                    or tmp == c_t.URD 
                    or tmp == c_t.URDL
                    or tmp == c_t.URL 
                    or tmp == c_t.RD 
                    or tmp == c_t.UR))
                {
                    dungeon[xx, yy] = c_t.L;
                }
                
                tmp = dungeon[xx, yy]
                /* If there"s a hallway to the right of the X type cell...                            */
                if (dungeon[xx - 1, yy] == c_t.X and 
                    (tmp == c_t.RDL 
                    or tmp == c_t.RL   
                    or tmp == c_t.UDL  
                    or tmp == c_t.URDL 
                    or tmp == c_t.URL  
                    or tmp == c_t.DL   
                    or tmp == c_t.UL))
                {
                    dungeon[xx - 1, yy] = c_t.R;
                }
            }      
        
            if(yy > 0) {
                tmp = dungeon[xx, yy - 1]
                /* If there"s a hallway above the X type cell...                                      */
                if (dungeon[xx, yy] == c_t.X and 
                    (tmp == c_t.RDL 
                    or tmp == c_t.UD   
                    or tmp == c_t.URD  
                    or tmp == c_t.URDL 
                    or tmp == c_t.UDL  
                    or tmp == c_t.RD   
                    or tmp == c_t.DL))
                {
                    dungeon[xx, yy] = c_t.U;
                }
                
                tmp = dungeon[xx, yy]
                /* If there"s a hallway below the X type cell...                                      */
                if (dungeon[xx, yy - 1] == c_t.X and 
                    (tmp == c_t.URL 
                    or tmp == c_t.UD   
                    or tmp == c_t.UDL  
                    or tmp == c_t.URDL 
                    or tmp == c_t.URD  
                    or tmp == c_t.UR   
                    or tmp == c_t.UL))
                {
                    dungeon[xx, yy - 1] = c_t.D;
                }    
  
            }    
        }
    
    }
    
    
    
    
}  // while(all_ok == false)
    

