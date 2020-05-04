/*

Hello and welcome to the Easy Dungeon Generator.

If you wanted to fiddle with the idea of the procedural generation,
here's another chance to do it.

This asset will create a randomized dungeon for you, put some placeholder
objects into it, and let you walk around in it.

It is intended to be easy for beginners and non-programmers to use
extend and modify. Here's how to do it.

*/

/*****************************************************************/       
/*                      BRIEF SUMMARY                            */

/*****************************************************************/       
/* The generator uses data from a 'cell' script to generate a    */
/* dungeon. The structure of such file is explained below.       */
/* (Also see dungeon_cells, office_cells and                     */
/* clean_cells_template for more info.)                          */
/*                                                               */
/* After you have created your cell file from a template or      */
/* edited an existing one, you will need to create a dungeon     */
/* generator object, that executes the cell script and the       */
/* put_dungeon script when it is created.                        */
/* See Objects \ Dungeons for a reference.                       */
/*                                                               */
/* After that put your generator object into a big enough room   */
/* run the game and you will have your dungeon.                  */
/* (For a 6 by 6 dungeon, you will need 2304 by 2304 px room.    */
/*  The side of one cell is 512 pixels by default.)              */
      

/*****************************************************************/       
/*                      THE CELLS FILE                           */

/*****************************************************************/       
/*                          LEGEND                               */
/*                                                               */
/*  This is the legend. Here we use the map data structure       */
/*  to define which characters we will use to specify            */
/*  placement of various objects inside the cells of the dungeon */
                   
        legend = ds_map_create();

/*                +-- Put the characters you will use for         
                  |   the object inside the quotes          
                  |            
                  |      +-- Put the object you want to use                        
                  |      |   here
                  v      v                                         */

        legend[? "Pl"] = obj_player;
        legend[? "[]"] = obj_dungeon_wall;
        legend[? "Ex"] = obj_repeat;
        
        legend[? "G1"] = obj_dungeon_cat_monster;
        legend[? "G2"] = obj_dungeon_potato_monster;
        legend[? "G3"] = obj_office_cat_monster;
        legend[? "G4"] = obj_office_potato_monster;

        legend[? "Lo"] =obj_locked_door;
        legend[? "Ky"] =obj_key;

        legend[? "TT"] = obj_dungeon_altar;
        legend[? "\\/"] = obj_dungeon_light;


/*  To add another object to the legend just duplicate a line    */
/*  and replace the character and the object name.               */
/*                                                               */
/*  The dungeon generator assumes, that every object has the     */
/*  origin point at the center of its bottom. Check that in      */
/*  sprite properties.                                           */
/*                                                               */
/*****************************************************************/       


/*****************************************************************/       
/*                             CELLS                             */
/*                                                               */
/*  The dungeon is made from square elements, that I call cells. */
/*  Each cell has the same size, and it is specified below.      */

cell_size = 12;

/*  If you would like to change the size of the cells you can    */
/*  do it, but you will need to redo all of the cell             */
/*  templates below to be of the right size.                     */
/*                                                               */
/*  Also keep in mind, that the generator rotates cells to       */
/*  create a dungeon, so they all should be square.              */
/*                                                               */
/*  For each object that the dungeon generator puts into the     */
/*  room, the rotation parameter is set. Use it for the objects  */
/*  that are sensitive to turning. Note, that the rotation       */
/*  parameter is only set after the create event is completed.   */
/*  So use step or an alarm to turn the object or change the     */
/*  sprite. Check out obj_dungeon_cat_monster to see how it is   */
/*  done through an alarm event.                                 */
/*                                                               */
/*****************************************************************/       

// Here we set the tile size, and the dungeon size in cells.
// Don't make it too big, or the generation will be really slow.
// Don't make it too small either, the dungeon should be at least
// 3 by 3 for the algorithm to work right. 
// If one of the sides is less than 3, it will be set to 3 by the 
// put_dungeon script.

tile_size =32;
dungeon_width = 6;
dungeon_height = 6;

/*****************************************************************/       
/*                           CELL TYPES                          */
/*                                                               */
/*  There are several types of cells that the dungeon generator  */
/*  uses. Those are: start, finish, X, D, RD, UD, RDL and URDL.  */
/*  Letters U, R, D and L, mean Up, Right, Down and Left.        */
/*  From the cell of type URDL a player should be able to freely */
/*  exit in any of the four directions.                          */
/*  A cell of type RDL only has exits on Right, Down and Left.   */
/*  UD - only up and down. RD - Right and Down. D - Down.        */
/*  Cells of the type start and finish are UD cells with         */
/*  entrance and exit points to the dungeon.                     */
/*  Put your player object into the start cell and an exit point */
/*  into the finish cell.                                        */
/*  Cells of the type X are impossible to pass through and       */
/*  should have no exits.                                        */
/*                                                               */

/*****************************************************************/       
/*                      CELL TYPE START                          */
/*                                                               */
/*  Start is the type of cell that only has the exit down        */
/*  Put your player starting point here.                         */
/*                                                               */
/*  (You don't really need the dot's, they're just here for      */
/*   convenience. Any 2-char entries that arent' in the legend   */
/*   or are misplaced are ignored)                               */
/*                                                               */
/****                                                         ****/

j = 0;

  /*************************************************************/       
  /*  This is the body of the cell start.                      */
  /*  12 array entries, each holding a 24 character string.    */
  /*  Edit the contents of the strings to change cell layout.  */
  /*  Remember that all lines should stay of the same length.  */
  
  //     /---------------------------------------\

         // ---
         i =0;
         cell_start[j, i++] = "[][][][][][][][][][][][]"
         cell_start[j, i++] = "[] . . . . . . . . . .[]"
         cell_start[j, i++] = "[] . . . . . . . . . .[]"
         cell_start[j, i++] = "[] . . . . . . . . . .[]"
         cell_start[j, i++] = "[] . . . . .Pl . . . .[]"
         cell_start[j, i++] = "[] . . . . . . . . . .[]"
         cell_start[j, i++] = "[] . . . . . . . . . .[]"
         cell_start[j, i++] = "[] . . . . . . . . . .[]"
         cell_start[j, i++] = "[] . . . . . . . . . .[]"
         cell_start[j, i++] = "[] . . . . . . . . . .[]"
         cell_start[j, i++] = "[] . . . . . . . . . .[]"
         cell_start[j, i++] = "[] . . . . . . . . . .[]"
         j++;

  //     \---------------------------------------/
  
  /*  Copy and paste all of it, including the i = 0; and j++;  */
  /*  lines to add another cell of the type start.             */
  /*                                                           */
  /*************************************************************/       


/*****************************************************************/       
/*                      CELL TYPE FINISH                         */
/*                                                               */
/*  Finish is the type of cell that only has the exit down       */
/*  Put your exit point here.                                    */

j = 0;

// /---------------------------------------\
    i =0;
    cell_finish[j, i++] ="[][][][][][][][][][][][]"
    cell_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_finish[j, i++] ="[] . . . . .Ex . . . .[]"
    cell_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_finish[j, i++] ="[] . . . . . . . . . .[]"
    j++;
// \---------------------------------------/

/*  Copy and paste all of it, including the i = 0; and j++;      */
/*  lines to add another cell of this type.                      */
/*                                                               */
/*****************************************************************/       

     
/*****************************************************************/       
/*                      CELL TYPE X                              */
/*                                                               */
/*  X is the type of cell that has no exits                      */

j = 0;

// /---------------------------------------\
    i =0;
    cell_X[j, i++] ="[][][][][][][][][][][][]"
    cell_X[j, i++] ="[] . . . . . . . . . .[]"
    cell_X[j, i++] ="[] . . . . . . . . . .[]"
    cell_X[j, i++] ="[] . . . . . . . . . .[]"
    cell_X[j, i++] ="[] . . . . . . . . . .[]"
    cell_X[j, i++] ="[] . . . . . . . . . .[]"
    cell_X[j, i++] ="[] . . . . . . . . . .[]"
    cell_X[j, i++] ="[] . . . . . . . . . .[]"
    cell_X[j, i++] ="[] . . . . . . . . . .[]"
    cell_X[j, i++] ="[] . . . . . . . . . .[]"
    cell_X[j, i++] ="[] . . . . . . . . . .[]"
    cell_X[j, i++] ="[][][][][][][][][][][][]"
    j++;
// \---------------------------------------/

/*                                                               */
/*****************************************************************/       



/*****************************************************************/       
/*                      CELL TYPE D                              */
/*                                                               */
/*  D is the type of cell that only has an exit down             */
j = 0;

// /---------------------------------------\
    i =0;
    cell_D[j, i++] ="[][][][][][][][][][][][]"
    cell_D[j, i++] ="[] . . . . . . . . . .[]"
    cell_D[j, i++] ="[] .[] . . . . . . . .[]"
    cell_D[j, i++] ="[] .[] . . . . . . . .[]"
    cell_D[j, i++] ="[] .[] . . . . . . . .[]"
    cell_D[j, i++] ="[] . . . . . . . . . .[]"
    cell_D[j, i++] ="[] . . . . . . . . . .[]"
    cell_D[j, i++] ="[] . . . . . . . . . .[]"
    cell_D[j, i++] ="[] . . . .G1 . . . . .[]"
    cell_D[j, i++] ="[] . . . . . . . . . .[]"
    cell_D[j, i++] ="[] . . . . . . . . . .[]"
    cell_D[j, i++] ="[] . . . . . . . . . .[]"
    j++;
// \---------------------------------------/

/*                                                               */
/*****************************************************************/       


/*****************************************************************/       
/*                      CELL TYPE RD                             */
/*                                                               */
/*  RD is the type of cell that has exits down and to the right  */
j = 0;

// /---------------------------------------\
    i =0;
    cell_RD[j, i++] ="[][][][][][][][][][][][]"
    cell_RD[j, i++] ="[] . . . . . . . . . . ."
    cell_RD[j, i++] ="[] .\\/ . . . . . . . . ."
    cell_RD[j, i++] ="[] . . . . . . . . . . ."
    cell_RD[j, i++] ="[] . . . . . . . . . . ."
    cell_RD[j, i++] ="[] . . . . . . . . . . ."
    cell_RD[j, i++] ="[] . . . . . . . . . . ."
    cell_RD[j, i++] ="[] . . . . . . . . . . ."
    cell_RD[j, i++] ="[] . . . . . . . . . . ."
    cell_RD[j, i++] ="[] . . . . . . . . . . ."
    cell_RD[j, i++] ="[] . . . . . . . . .[][]"
    cell_RD[j, i++] ="[] . . . . . . . . .[][]"
    j++;
// \---------------------------------------/

/*****************************************************************/       
/*                      CELL TYPE UD                             */
/*                                                               */
/*  UD is the type of cell that has exits up and down.           */
j = 0;

// /---------------------------------------\
    i =0;
    cell_UD[j, i++] ="[] . . . . . . . . . .[]"
    cell_UD[j, i++] ="[] . . . . . . . . . .[]"
    cell_UD[j, i++] ="[] . . . . . . . . . .[]"
    cell_UD[j, i++] ="[] . . . . . . . . . .[]"
    cell_UD[j, i++] ="[] . . . . . . . . . .[]"
    cell_UD[j, i++] ="[] . . . . . . . . . .[]"
    cell_UD[j, i++] ="[] .\\/ . . . . . . . .[]"
    cell_UD[j, i++] ="[] . . . . . . . . . .[]"
    cell_UD[j, i++] ="[] . . . . . . . . . .[]"
    cell_UD[j, i++] ="[] . . . . . . . . . .[]"
    cell_UD[j, i++] ="[] . . . . . . . . . .[]"
    cell_UD[j, i++] ="[] . . . . . . . . . .[]"
    j++;
// \---------------------------------------/
/*                                                               */
/*****************************************************************/       


/*****************************************************************/       
/*                      CELL TYPE RDL                            */
/*                                                               */
/*  RDL is the type of cell that has exits right, down and left  */
j = 0;

// /---------------------------------------\
    i =0;
    cell_RDL[j, i++] ="[][][][][][][][][][][][]"
    cell_RDL[j, i++] =" . . . . . . . . . . . ."
    cell_RDL[j, i++] =" . . . . .\\/ . . . . . ."
    cell_RDL[j, i++] =" . . . . . . . . . . . ."
    cell_RDL[j, i++] =" . . . . . . . . . . . ."
    cell_RDL[j, i++] =" . . . . . . . . . . . ."
    cell_RDL[j, i++] =" . . . . . . . . . . . ."
    cell_RDL[j, i++] =" . . . . . . . . . . . ."
    cell_RDL[j, i++] =" . . . . . . . . . . . ."
    cell_RDL[j, i++] =" . . . . . . . . . . . ."
    cell_RDL[j, i++] =" . . . . . . . . . . . ."
    cell_RDL[j, i++] ="[] . . . . . . . . . .[]"
    j++;
// \---------------------------------------/
/*                                                               */
/*****************************************************************/       


/*****************************************************************/       
/*                      CELL TYPE URDL                           */
/*                                                               */
/*  URDL is the type of cell that has exits up, right, down and  */
/*  left                                                         */
j = 0;

// /---------------------------------------\
    i =0;
    cell_URDL[j, i++] ="[] . . . . . . . . . .[]"
    cell_URDL[j, i++] =" . . . . . . . . . . . ."
    cell_URDL[j, i++] =" . . . . . . . . . . . ."
    cell_URDL[j, i++] =" . . . . . . . . . . . ."
    cell_URDL[j, i++] =" . . . . . . . . . . . ."
    cell_URDL[j, i++] =" . . . . . . . . . . . ."
    cell_URDL[j, i++] =" . . . . . . . . . . . ."
    cell_URDL[j, i++] =" . . . . . . . . . . . ."
    cell_URDL[j, i++] =" . . . . . . . . . . . ."
    cell_URDL[j, i++] =" . . . . . . . . . . . ."
    cell_URDL[j, i++] =" . . . . . . . . . . . ."
    cell_URDL[j, i++] ="[] . . . . . . . . . .[]"
    j++;
// \---------------------------------------/
/*                                                               */
/*****************************************************************/   


/*****************************************************************/       
/*                      CELL TYPE LOCK                           */
/*                                                               */
/*  LOCK is the type of cell that has an exit down and is locked */
/*  or contains a locked entity of some kind.                    */
/*                                                               */
/*  You can use insert_lock_room() command when creating a       */
/*  dungeon to insert a room of type LOCK into it.               */
/*                                                               */
// Cell type LOCK -----------
j =0;

// /---------------------------------------\
    i =0;
    cell_lock[j, i++] ="[][][][][][][][][][][][]"
    cell_lock[j, i++] ="[] . . . . . . . . . .[]"
    cell_lock[j, i++] ="[] . . .[][][][] . . .[]"
    cell_lock[j, i++] ="[] . .Lo . . . .[] . .[]"
    cell_lock[j, i++] ="[] . .Lo . . . .[] . .[]"
    cell_lock[j, i++] ="[] .[][][][][][][][] .[]"
    cell_lock[j, i++] ="[] .[][][][] .[][][] .[]"
    cell_lock[j, i++] ="[] .[][][] . .[][][] .[]"
    cell_lock[j, i++] ="[] .[][][][][][][][] .[]"
    cell_lock[j, i++] ="[] . .[][][][][][] . .[]"
    cell_lock[j, i++] ="[] . . . . . . . . . .[]"
    cell_lock[j, i++] ="[] . . . . . . . . . .[]"
    j++;
// \---------------------------------------/
/*                                                               */
/*****************************************************************/   


/*****************************************************************/       
/*                      CELL TYPE KEY                            */
/*                                                               */
/*  KEY is the type of cell that has an exit down and contains   */
/*  a key, that can be used to open a cell of type LOCK.         */
/*                                                               */
/*  You can use insert_key_room() command when creating a        */
/*  dungeon to insert a room of type KEY into it.                */
/*                                                               */

// Cell type KEY -----------
j =0;

// /---------------------------------------\
    i =0;
    cell_key[j, i++] ="[][][][][][][][][][][][]"
    cell_key[j, i++] ="[] . . . . . . . . . .[]"
    cell_key[j, i++] ="[] .[] .Ky . . . . . .[]"
    cell_key[j, i++] ="[] .[] . . . . . . . .[]"
    cell_key[j, i++] ="[] . . . .[][] . . . .[]"
    cell_key[j, i++] ="[] . . .[] . .[] . . .[]"
    cell_key[j, i++] ="[] . . .[] . .[] . . .[]"
    cell_key[j, i++] ="[] . . . .[][] . . . .[]"
    cell_key[j, i++] ="[] . . . .[] . . . . .[]"
    cell_key[j, i++] ="[] . . . .[] . . . . .[]"
    cell_key[j, i++] ="[] . . . .[][] . . . .[]"
    cell_key[j, i++] ="[] . . . .[] . . . . .[]"
    j++;
// \---------------------------------------/
/*                                                               */
/*****************************************************************/   


/*****************************************************************/       
/*                      CELL TYPE LOCKED FINISH                  */
/*                                                               */
/*  LOCKED FINISH is the type of cell that has an exit down and  */
/*  contains an locked exit that can be opened with a key from   */
/*  cell type KEY.                                               */
/*                                                               */
/*  You can use insert_locked_finish_room() command when         */
/*  creating a dungeon to insert a room of type KEY into it.     */
/*                                                               */
j =0;

// /---------------------------------------\
    i =0;
    cell_locked_finish[j, i++] ="[][][][][][][][][][][][]"
    cell_locked_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_locked_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_locked_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_locked_finish[j, i++] ="[] . . . .Ex . . . . .[]"
    cell_locked_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_locked_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_locked_finish[j, i++] ="[][][][][]LoLo[][][][][]"
    cell_locked_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_locked_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_locked_finish[j, i++] ="[] . . . . . . . . . .[]"
    cell_locked_finish[j, i++] ="[] . . . . . . . . . .[]"
    j++;
// \---------------------------------------/
/*                                                               */
/*****************************************************************/   

    
