/*                                                                                                */
/* Just some constants for all the cell types.                                                    */
/* URDL stand for Up, Down, Left and Right. Type X is for an impassable filled cell.              */
/*                                                                                                */
enum c_t {
   start,
   startU,
   startR,
   startL,
   finish,
   finishU,
   finishR,
   finishL,
   locked_finish,
   locked_finishU,
   locked_finishR,
   locked_finishL,
   X,

   lock,
   lockU,
   lockR,
   lockL,
   key,
   keyU,
   keyR,
   keyL,   
       
   U,
   R,
   D,
   L,
   
   UD,
   RL,
   
   UR,
   RD,
   UL,
   DL,
   
   RDL,
   UDL,
   URL,
   URD,
   
   URDL
   };
